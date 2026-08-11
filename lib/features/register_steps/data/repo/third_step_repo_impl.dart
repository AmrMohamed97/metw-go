import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/data_source/third_step_data_source.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/register_steps/data/models/third_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/repo/third_step_repo.dart';

@Injectable(as: ThirdStepRepo)
class ThirdStepRepoImpl implements ThirdStepRepo {
  final ThirdStepDataSource dataSource;

  ThirdStepRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, GovernorateListResponse>> getGovernorates() async {
    try {
      final response = await dataSource.getGovernorates();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityListResponse>> getCities(List<int> governorateIds) async {
    try {
      final response = await dataSource.getCities(governorateIds);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FirstStepOutModel>> submitThirdStep(
      ThirdStepInputModel input) async {
    try {
      final response = await dataSource.submitThirdStep(input);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
