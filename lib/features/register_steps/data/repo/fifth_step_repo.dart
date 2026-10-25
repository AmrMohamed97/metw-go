import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/models/fifth_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';

abstract class FifthStepRepo {
  Future<Either<Failure, FirstStepOutModel>> submitFifthStep(
    FifthStepInputModel input,
  );
}
