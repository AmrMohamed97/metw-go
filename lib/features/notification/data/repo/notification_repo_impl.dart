import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/notification/data/data_source/notification_data_source.dart';
import 'package:metw_go/features/notification/data/models/notification_response.dart';
import 'package:metw_go/features/notification/data/repo/notification_repo.dart';

@Injectable(as: NotificationRepo)
class NotificationRepoImpl implements NotificationRepo {
  final NotificationDataSource dataSource;

  NotificationRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, NotificationResponse>> getNotifications({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await dataSource.getNotifications(
        page: page,
        limit: limit,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
