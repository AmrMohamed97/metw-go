import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/notification/data/models/notification_response.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationResponse>> getNotifications({
    int? page,
    int? limit,
  });
}
