import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/driver_info/data/models/update_work_info_input_model.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';

abstract class DelegateInfoRepo {
  Future<Either<Failure, ProfileOutModel>> updateWorkInfo(
    UpdateWorkInfoInputModel inputModel,
  );
  Future<Either<Failure, WarehouseListResponse>> getWarehouses();
}
