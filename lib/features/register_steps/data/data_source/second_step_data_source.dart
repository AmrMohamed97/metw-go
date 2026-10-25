import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/second_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:retrofit/retrofit.dart';

part 'second_step_data_source.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
@injectable
abstract class SecondStepDataSource {
  @factoryMethod
  factory SecondStepDataSource(Dio dio) = _SecondStepDataSource;

  @GET(EndPoints.transportTypes)
  Future<TransportTypeListResponse> getTransportTypes();

  @POST(EndPoints.registerStep3)
  Future<FirstStepOutModel> submitSecondStep(
    @Body() SecondStepInputModel input,
  );
}
