import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/service_areas/data/models/update_service_areas_input_model.dart';
import 'package:retrofit/retrofit.dart';

part 'service_areas_data_source.g.dart';

@injectable
@RestApi()
abstract class ServiceAreasDataSource {
  @FactoryMethod()
  factory ServiceAreasDataSource(Dio dio) = _ServiceAreasDataSource;

  @GET(EndPoints.governorates)
  Future<GovernorateListResponse> getGovernorates();

  @GET(EndPoints.cities)
  Future<CityListResponse> getCities(
    @Query('governorate_ids[]') List<int> governorateIds,
  );

  @PUT(EndPoints.profileServiceAreasUrl)
  Future<ProfileOutModel> updateServiceAreas(
    @Body() UpdateServiceAreasInputModel inputModel,
  );
}
