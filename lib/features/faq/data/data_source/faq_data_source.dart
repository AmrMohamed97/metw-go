import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/faq/data/models/faq_response.dart';
import 'package:retrofit/retrofit.dart';

part 'faq_data_source.g.dart';

@injectable
@RestApi()
abstract class FaqDataSource {
  @FactoryMethod()
  factory FaqDataSource(Dio dio) = _FaqDataSource;

  @GET(EndPoints.faqUrl)
  Future<FaqResponse> getFaq();
}
