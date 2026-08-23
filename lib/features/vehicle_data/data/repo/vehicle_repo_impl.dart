import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/vehicle_data/data/data_source/vehicle_data_source.dart';
import 'package:metw_go/features/vehicle_data/data/repo/vehicle_repo.dart';

@Injectable(as: VehicleRepo)
class VehicleRepoImpl implements VehicleRepo {
  final VehicleDataSource vehicleDataSource;

  VehicleRepoImpl({required this.vehicleDataSource});

  @override
  Future<Either<Failure, TransportTypeListResponse>> getTransportTypes() async {
    try {
      final response = await vehicleDataSource.getTransportTypes();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileOutModel>> updateTransport(
    int transportTypeId,
    String plateNumber,
    File? vehicleImage,
  ) async {
    try {
      final response = await vehicleDataSource.updateTransport(
        transportTypeId,
        plateNumber,
        vehicleImage,
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
