import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/notifications/local_notification_service.dart';
import 'package:metw_go/core/notifications/notification_handler.dart';
import 'package:metw_go/firebase_options.dart';
import 'package:metw_go/metw_go.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    // name: 'dental-clinic-b0628' ,
    options: DefaultFirebaseOptions.currentPlatform);
  Future.wait([NotificationHandler.init(), LocalNotificationService.init()]);
  runApp(const MetwGo());
}
