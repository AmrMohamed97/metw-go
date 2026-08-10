import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
 import 'package:metw_go/features/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_out_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_out_model.dart';
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImplement implements ForgetPasswordRepo {
  final ForgetPasswordDataSource forgetPasswordDataSource;

  ForgetPasswordRepoImplement(this.forgetPasswordDataSource);

  @override
  Future<Either<Failure, ForgetPasswordOutModel>> sendOtp(ForgetPasswordInputModel inputModel) async {
    try {
      final response = await forgetPasswordDataSource.sendOtp(inputModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangePasswordOutModel>> changePassword(ChangePasswordInputModel inputModel) async {
    try {
      final response = await forgetPasswordDataSource.changePassword(inputModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
