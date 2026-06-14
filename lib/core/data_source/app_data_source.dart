import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/models/empty_data_response.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:retrofit/retrofit.dart';

part 'app_data_source.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppDataSource {
  @FactoryMethod()
  factory AppDataSource(Dio dio) =>
      _AppDataSource(dio, baseUrl: EndPoints.baseUrl);

  @POST(EndPoints.logoutUrl)
  Future<EmptyDataResponse> logout();
}
