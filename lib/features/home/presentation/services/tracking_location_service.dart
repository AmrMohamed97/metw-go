import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:metw_go/features/home/presentation/services/firebase_rtdb_helper.dart';

class TrackingLocationService {
  StreamSubscription<Position>? _positionStreamSubscription;
  final FirebaseDatabase _database = FirebaseRtdbHelper.database;
  DateTime? _lastUpdateTime;
  double _currentIntervalSeconds = 10;
  static const double _minInterval = 5;
  static const double _maxInterval = 30;

  // Singleton pattern
  static final TrackingLocationService _instance = TrackingLocationService._internal();

  factory TrackingLocationService() {
    return _instance;
  }

  TrackingLocationService._internal();

  /// Initialize location permissions
  Future<bool> initialize() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    // Persistence is handled by FirebaseRtdbHelper
    // _database.ref('drivers').keepSynced(true);

    return true;
  }

  /// Start tracking the rider's location and upload to Firestore
  Future<void> startTracking({
    required String driverId,
    // required String driverName,
  }) async {
    final hasPermission = await initialize();
    if (!hasPermission) {
      debugPrint('Location permission denied or service disabled.');
      return;
    }

    // Stop existing stream if any
    // await stopTracking(driverId);

    LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 10,
        forceLocationManager: false,
        intervalDuration: const Duration(seconds: 10),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText: "يتم تحديث موقعك الآن لضمان وصول الطلبات بدقة",
          notificationTitle: "خدمة التوصيل نشطة",
          enableWakeLock:
              true, // يمنع دخول المعالج في وضع النوم لضمان دقة التتبع
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.automotiveNavigation,
        distanceFilter: 10,
        pauseLocationUpdatesAutomatically: false,
        showBackgroundLocationIndicator: true,
        allowBackgroundLocationUpdates: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 10,
      );
    }

    // Update status to online immediately to reflect in UI/DB right away
    try {
      Position? lastPosition = await Geolocator.getLastKnownPosition();
      if (lastPosition != null) {
        await _updateLocationInRealtimeDatabase(driverId, lastPosition, 'online');
      } else {
        await _database.ref('drivers').child(driverId).update({
          'status': 'online',
        });
      }
    } catch (e) {
      debugPrint('Error setting initial online status: $e');
      await _database.ref('drivers').child(driverId).update({
        'status': 'online',
      });
    }

    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position position) {
            _throttledUpdate(
              driverId, 
              position, 
              // driverName
              );
          },
          onError: (e) {
            debugPrint('Error in location stream: $e');
          },
        );

    debugPrint('Started location tracking for driver: $driverId');
  }

  /// Stop tracking
  Future<void> stopTracking(String driverId) async {
    await _database.ref('drivers').child(driverId).update({
      // 'lastUpdated': ServerValue.timestamp,
      'status': 'offline',
    });
    // _updateLocationInRealtimeDatabase(driverId, position, driverName,'offline');
    if (_positionStreamSubscription != null) {
      await _positionStreamSubscription!.cancel();
      _positionStreamSubscription = null;
      debugPrint('Stopped location tracking.');
    }
  }

  void _throttledUpdate(
    String driverId, 
    Position position, 
    // String driverName
    ) {
    final now = DateTime.now();

    // Battery Optimization: Adjust interval based on speed
    // If moving fast (> 20km/h), update more frequently. If slow/stopped, update less.
    double speedKmh = position.speed * 3.6;
    if (speedKmh > 20) {
      _currentIntervalSeconds = _minInterval;
    } else if (speedKmh < 5) {
      _currentIntervalSeconds = _maxInterval;
    } else {
      _currentIntervalSeconds = 15;
    }

    if (_lastUpdateTime == null ||
        now.difference(_lastUpdateTime!).inSeconds >= _currentIntervalSeconds) {
      _lastUpdateTime = now;
      _updateLocationInRealtimeDatabase(
        driverId,
        position,
        // driverName,
        'online',
      );
    }
  }

  /// Update location in Realtime Database
  Future<void> _updateLocationInRealtimeDatabase(
    String driverId,
    Position position,
    // String driverName,
    String status,
  ) async {
    try {
      await _database.ref('drivers').child(driverId).set({
        'location': {'lat': position.latitude, 'lng': position.longitude},
        // 'lastUpdated': ServerValue.timestamp,
        'status': status,
        // 'name': driverName,
        // 'speed': position.speed,
        // 'heading': position.heading,
      });
      debugPrint(
        'Location updated in Realtime Database: ${position.latitude}, ${position.longitude}',
      );
    } catch (e) {
      debugPrint('Error updating location in Realtime Database: $e');
    }
  }
}
