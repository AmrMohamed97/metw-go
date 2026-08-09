import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/otp/data/data_source/otp_data_source.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_out_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_out_model.dart';
import 'package:metw_go/features/otp/data/repo/otp_repo.dart';

@Injectable(as: OtpRepo)
class OtpRepoImplement implements OtpRepo {
  final OtpDataSource otpDataSource;

  OtpRepoImplement(this.otpDataSource);

  @override
  Future<Either<Failure, VerifyOtpOutModel>> verifyOtp(VerifyOtpInputModel inputModel) async {
    try {
      final response = await otpDataSource.verifyOtp(inputModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResendOtpOutModel>> resendOtp(ResendOtpInputModel inputModel) async {
    try {
      final response = await otpDataSource.resendOtp(inputModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
