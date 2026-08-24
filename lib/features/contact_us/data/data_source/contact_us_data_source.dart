import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';
import 'package:retrofit/retrofit.dart';

part 'contact_us_data_source.g.dart';

@injectable
@RestApi()
abstract class ContactUsDataSource {
  @FactoryMethod()
  factory ContactUsDataSource(Dio dio) = _ContactUsDataSource;

  @GET(EndPoints.contactUsUrl)
  Future<ContactUsResponse> getContactUs();
}
