import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/driver_info/data/data_source/delegate_info_data_source.dart';
import 'package:metw_go/features/driver_info/data/models/update_work_info_input_model.dart';
import 'package:metw_go/features/driver_info/data/repo/delegate_info_repo.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';

@Injectable(as: DelegateInfoRepo)
class DelegateInfoRepoImpl implements DelegateInfoRepo {
  final DelegateInfoDataSource delegateInfoDataSource;

  DelegateInfoRepoImpl({required this.delegateInfoDataSource});

  @override
  Future<Either<Failure, ProfileOutModel>> updateWorkInfo(
    UpdateWorkInfoInputModel inputModel,
  ) async {
    try {
      final response = await delegateInfoDataSource.updateWorkInfo(inputModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WarehouseListResponse>> getWarehouses() async {
    try {
      final response = await delegateInfoDataSource.getWarehouses();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
