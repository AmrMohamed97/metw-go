import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_out_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_out_model.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, ForgetPasswordOutModel>> sendOtp(ForgetPasswordInputModel inputModel);
  Future<Either<Failure, ChangePasswordOutModel>> changePassword(ChangePasswordInputModel inputModel);
}
