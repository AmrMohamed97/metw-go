import 'package:metw_go/features/notification/data/models/notification_response.dart';

abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final NotificationResponse response;

  NotificationSuccessState(this.response);
}

class NotificationFailureState extends NotificationState {
  final String message;

  NotificationFailureState(this.message);
}
