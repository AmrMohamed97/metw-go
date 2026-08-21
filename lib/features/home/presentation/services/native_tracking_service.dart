import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NativeTrackingService {
  static const MethodChannel _channel = MethodChannel(
    'com.metw_go/location_tracking',
  );

  // Singleton pattern
  static final NativeTrackingService _instance =
      NativeTrackingService._internal();

  factory NativeTrackingService() {
    return _instance;
  }

  NativeTrackingService._internal();

  Future<void> startNativeTracking(String driverId) async {
    try {
      await _channel.invokeMethod('startTracking', {'driverId': driverId});
      debugPrint('Started native tracking for driver: $driverId');
    } on PlatformException catch (e) {
      debugPrint("Failed to start native tracking: '${e.message}'.");
    }
  }

  Future<void> stopNativeTracking() async {
    try {
      await _channel.invokeMethod('stopTracking');
      debugPrint('Stopped native tracking.');
    } on PlatformException catch (e) {
      debugPrint("Failed to stop native tracking: '${e.message}'.");
    }
  }
}
