import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/register_steps/data/models/third_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'third_step_data_source.g.dart';

@RestApi()
@injectable
abstract class ThirdStepDataSource {
  @factoryMethod
  factory ThirdStepDataSource(Dio dio) = _ThirdStepDataSource;

  @GET(EndPoints.governorates)
  Future<GovernorateListResponse> getGovernorates();

  @GET(EndPoints.cities)
  Future<CityListResponse> getCities(
    @Query('governorate_ids[]') List<int> governorateIds,
  );

  @POST(EndPoints.registerStep4)
  Future<FirstStepOutModel> submitThirdStep(@Body() ThirdStepInputModel input);
}
