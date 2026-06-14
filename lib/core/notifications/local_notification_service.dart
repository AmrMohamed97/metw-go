import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  static void onTap(NotificationResponse notificationResponse) {
    if (kDebugMode) {
      print('Notification tapped - ID: ${notificationResponse.id}');
    }

    try {
      final Map<String, dynamic>? map = jsonDecode(
        notificationResponse.payload ?? "{}",
      );

      if (kDebugMode) {
        print('Notification payload: $map');
      }

      if (map != null && map.isNotEmpty) {
        if (kDebugMode) {
          print('Processing navigation for payload: $map');
        }
        // Delay navigation to ensure app is ready
        Future.delayed(const Duration(milliseconds: 500), () {
          navigateBasedOnPayload(map);
        });
      } else {
        if (kDebugMode) {
          print('Empty payload - no navigation needed');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing notification payload: $e');
      }
    }
  }

  static Future init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //! basic Notification
  static void showBasicNotification(RemoteMessage message) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      icon: "@drawable/ic_notification",
    );
    const NotificationDetails details = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: details,
      payload: jsonEncode(message.data),
    );
  }

  //! Notification with Image Support
  static void showNotificationWithImage(RemoteMessage message) async {
    try {
      final String? imageUrl =
          message.notification?.android?.imageUrl ??
          message.notification?.apple?.imageUrl ??
          message.data['image'];

      AndroidNotificationDetails android;

      if (imageUrl != null && imageUrl.isNotEmpty) {
        // Download and cache the image
        final String? imagePath = await _downloadAndSaveFile(
          imageUrl,
          'notification_image',
        );

        android = AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.max,
          priority: Priority.high,
          icon: "@drawable/ic_notification",
          largeIcon: imagePath != null
              ? FilePathAndroidBitmap(imagePath)
              : null,
          styleInformation: imagePath != null
              ? BigPictureStyleInformation(
                  FilePathAndroidBitmap(imagePath),
                  contentTitle: message.notification?.title,
                  summaryText: message.notification?.body,
                )
              : BigTextStyleInformation(
                  message.notification?.body ?? '',
                  contentTitle: message.notification?.title,
                ),
        );
      } else {
        // No image, use basic notification with big text style
        android = const AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.max,
          priority: Priority.high,
          icon: "@drawable/ic_notification",
          styleInformation: BigTextStyleInformation(''),
        );
      }

      const DarwinNotificationDetails iOS = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      final NotificationDetails details = NotificationDetails(
        android: android,
        iOS: iOS,
      );

      await flutterLocalNotificationsPlugin.show(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        title: message.notification?.title,
        body: message.notification?.body,
        notificationDetails: details,
        payload: jsonEncode(message.data),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error showing notification with image: $e');
      }
      showBasicNotification(message);
    }
  }

  //! Download and save image file
  static Future<String?> _downloadAndSaveFile(
    String url,
    String fileName,
  ) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$fileName.png';

      // Create Dio instance
      final dio.Dio dioInstance = dio.Dio();

      // Download image using Dio
      final dio.Response<Uint8List> response = await dioInstance.get<Uint8List>(
        url,
        options: dio.Options(
          responseType: dio.ResponseType.bytes,
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final File file = File(filePath);
        await file.writeAsBytes(response.data!);
        return filePath;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading image with Dio: $e');
      }
    }
    return null;
  }

  static void navigateBasedOnPayload(Map<String, dynamic> map) {
    if (kDebugMode) {
      print("Navigating based on payload: $map");
    }

    try {
      final String? type = map["type"];
      final String? screen = map["screen"];

      if (type == null && screen == null) {
        if (kDebugMode) {
          print("No navigation type specified in payload");
        }
        return;
      }

      // Check if user is logged in
      // final String? token =
      //     sl<CacheHelper>().getStringData(key: AppConstants.token);
      // if (token == null) {
      //   if (kDebugMode) {
      //     print("User not logged in, cannot navigate");
      //   }
      //   return;
      // }

      // Handle different notification types
      switch (type?.toLowerCase()) {
        //! Handle Screens Here
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in navigation: $e");
      }
    }
  }
}
