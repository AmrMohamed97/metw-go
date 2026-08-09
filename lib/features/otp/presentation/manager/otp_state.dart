import 'package:metw_go/features/otp/data/models/resend_otp_out_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_out_model.dart';

abstract class OtpState {}

class InitialOtpState extends OtpState {}

class VerifyOtpLoadingState extends OtpState {}

class VerifyOtpSuccessState extends OtpState {
  final VerifyOtpOutModel verifyOtpOutModel;
  VerifyOtpSuccessState(this.verifyOtpOutModel);
}

class VerifyOtpErrorState extends OtpState {
  final String error;
  VerifyOtpErrorState({required this.error});
}

class ResendOtpLoadingState extends OtpState {}

class ResendOtpSuccessState extends OtpState {
  final ResendOtpOutModel resendOtpOutModel;
  ResendOtpSuccessState(this.resendOtpOutModel);
}

class ResendOtpErrorState extends OtpState {
  final String error;
  ResendOtpErrorState({required this.error});
}
