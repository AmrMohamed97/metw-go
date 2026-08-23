import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/service_areas/data/models/update_service_areas_input_model.dart';

abstract class ServiceAreasRepo {
  Future<Either<Failure, GovernorateListResponse>> getGovernorates();
  Future<Either<Failure, CityListResponse>> getCities(List<int> governorateIds);
  Future<Either<Failure, ProfileOutModel>> updateServiceAreas(
    UpdateServiceAreasInputModel inputModel,
  );
}
