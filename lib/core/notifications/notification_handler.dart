import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'local_notification_service.dart';

class NotificationHandler {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? fcmToken = '';

  static Future init() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    //! Get the token
    try {
      if (Platform.isIOS) {
        await firebaseMessaging.getAPNSToken();
        fcmToken = await firebaseMessaging.getToken();
      } else {
        fcmToken = await firebaseMessaging.getToken();
      }
      log('FCM Token: $fcmToken');
    } catch (e) {
      log('Error getting FCM token: $e');
    }
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    //! Ensure notifications show in foreground for iOS
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    //! Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showNotificationWithImage(message);

      if (!kReleaseMode) {
        log('Notification onMessage: ${message.notification?.title}');
        log('Notification Data: ${message.data}');
        log(
          'Notification Image: ${message.notification?.android?.imageUrl ?? message.notification?.apple?.imageUrl ?? "No image"}',
        );
      }
    });

    //! Handle taps on notifications when the app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNavigation(message.data);
    });

    final RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();
    if (initialMessage != null) {
      _handleNavigation(initialMessage.data);
    }
  }

  //! Handle background message
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    if (message.notification == null) {
      LocalNotificationService.showNotificationWithImage(message);
    }

    if (!kReleaseMode) {
      log('Background Notification: ${message.notification?.title}');
      log('Background Data: ${message.data}');
    }
  }

  static void _handleNavigation(Map<String, dynamic> data) {
    if (!kReleaseMode) {
      log('Handling navigation with data: $data');
    }

    // Handle navigation based on notification data
    LocalNotificationService.navigateBasedOnPayload(data);
  }
}
