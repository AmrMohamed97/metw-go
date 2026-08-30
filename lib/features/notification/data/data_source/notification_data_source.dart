import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/notification/data/models/notification_response.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_data_source.g.dart';

@injectable
@RestApi()
abstract class NotificationDataSource {
  @FactoryMethod()
  factory NotificationDataSource(Dio dio) = _NotificationDataSource;

  @GET(EndPoints.notificationsUrl)
  Future<NotificationResponse> getNotifications({
    @Query("page") int? page,
    @Query("limit") int? limit,
  });
}
