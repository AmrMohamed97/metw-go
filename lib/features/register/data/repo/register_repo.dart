import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register/data/models/register_input_model/register_input_model.dart';
import 'package:metw_go/features/register/data/models/register_out_model/register_out_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterOutModel>> createUser(
    RegisterInputModel createUserModel,
  );
}
