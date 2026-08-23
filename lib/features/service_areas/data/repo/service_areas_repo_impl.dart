import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/service_areas/data/data_source/service_areas_data_source.dart';
import 'package:metw_go/features/service_areas/data/models/update_service_areas_input_model.dart';
import 'package:metw_go/features/service_areas/data/repo/service_areas_repo.dart';

@Injectable(as: ServiceAreasRepo)
class ServiceAreasRepoImpl implements ServiceAreasRepo {
  final ServiceAreasDataSource serviceAreasDataSource;

  ServiceAreasRepoImpl({required this.serviceAreasDataSource});

  @override
  Future<Either<Failure, GovernorateListResponse>> getGovernorates() async {
    try {
      final response = await serviceAreasDataSource.getGovernorates();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityListResponse>> getCities(
    List<int> governorateIds,
  ) async {
    try {
      final response = await serviceAreasDataSource.getCities(governorateIds);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileOutModel>> updateServiceAreas(
    UpdateServiceAreasInputModel inputModel,
  ) async {
    try {
      final response = await serviceAreasDataSource.updateServiceAreas(
        inputModel,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
