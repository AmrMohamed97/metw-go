import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/data_source/second_step_data_source.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/repo/second_step_repo.dart';

@Injectable(as: SecondStepRepo)
class SecondStepRepoImpl implements SecondStepRepo {
  final SecondStepDataSource dataSource;

  SecondStepRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, TransportTypeListResponse>> getTransportTypes() async {
    try {
      final response = await dataSource.getTransportTypes();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FirstStepOutModel>> submitSecondStep(
    int transportTypeId,
    String plateNumber,
    File vehicleImage,
  ) async {
    try {
      final response = await dataSource.submitSecondStep(
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
