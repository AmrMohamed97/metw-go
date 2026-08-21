import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_out_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_out_model.dart';

abstract class OtpRepo {
  Future<Either<Failure, VerifyOtpOutModel>> verifyOtp(
    VerifyOtpInputModel inputModel,
  );
  Future<Either<Failure, ResendOtpOutModel>> resendOtp(
    ResendOtpInputModel inputModel,
  );
}
