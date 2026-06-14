import 'package:flutter/material.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/dental_clinic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // await Firebase.initializeApp(
  //   name: 'dental-clinic-b0628' ,
  //   options: DefaultFirebaseOptions.currentPlatform);
  // Future.wait([NotificationHandler.init(), LocalNotificationService.init()]);
  runApp(const MetwGo());
}
