import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/privacy/data/models/privacy_response.dart';
import 'package:retrofit/retrofit.dart';

part 'privacy_data_source.g.dart';

@injectable
@RestApi()
abstract class PrivacyDataSource {
  @FactoryMethod()
  factory PrivacyDataSource(Dio dio) = _PrivacyDataSource;

  @GET(EndPoints.privacyUrl)
  Future<PrivacyResponse> getPrivacy();
}
