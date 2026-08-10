import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';

abstract class FirstStepRepo {
  Future<Either<Failure, WarehouseListResponse>> getWarehouses();
  Future<Either<Failure, TransportTypeListResponse>> getTransportTypes();
  Future<Either<Failure, FirstStepOutModel>> submitFirstStep(
    FirstStepInputModel input,
  );
}
