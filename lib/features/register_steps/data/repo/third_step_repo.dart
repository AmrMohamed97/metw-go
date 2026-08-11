import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/register_steps/data/models/third_step_input_model.dart';

abstract class ThirdStepRepo {
  Future<Either<Failure, GovernorateListResponse>> getGovernorates();
  Future<Either<Failure, CityListResponse>> getCities(List<int> governorateIds);
  Future<Either<Failure, FirstStepOutModel>> submitThirdStep(
      ThirdStepInputModel input);
}
