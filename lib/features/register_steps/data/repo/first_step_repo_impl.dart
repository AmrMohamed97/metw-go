import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/data_source/first_step_data_source.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';
import 'package:metw_go/features/register_steps/data/repo/first_step_repo.dart';

@Injectable(as: FirstStepRepo)
class FirstStepRepoImpl implements FirstStepRepo {
  final FirstStepDataSource dataSource;

  FirstStepRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, WarehouseListResponse>> getWarehouses() async {
    try {
      final response = await dataSource.getWarehouses();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, TransportTypeListResponse>> getTransportTypes() async {
  //   try {
  //     final response = await dataSource.getTransportTypes();
  //     return Right(response);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, FirstStepOutModel>> submitFirstStep(
    FirstStepInputModel input,
  ) async {
    try {
      final response = await dataSource.submitFirstStep(input);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
