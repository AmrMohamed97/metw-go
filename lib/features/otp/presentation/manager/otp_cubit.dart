import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_state.dart';

import 'package:injectable/injectable.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_input_model.dart';
import 'package:metw_go/features/otp/data/repo/otp_repo.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  final OtpRepo otpRepo;
  OtpCubit(this.otpRepo) : super(InitialOtpState());

  Future<void> verifyOtp(String phone, String otp) async {
    emit(VerifyOtpLoadingState());
    final inputModel = VerifyOtpInputModel(
      phone: phone,
      otp: otp,
      purpose: "forgot_password",
    );
    final result = await otpRepo.verifyOtp(inputModel);
    result.fold(
      (failure) => emit(VerifyOtpErrorState(error: failure.message)),
      (successModel) => emit(VerifyOtpSuccessState(successModel)),
    );
  }

  Future<void> resendOtp(String phone) async {
    emit(ResendOtpLoadingState());
    final inputModel = ResendOtpInputModel(
      phone: phone,
      purpose: "forgot_password",
    );
    final result = await otpRepo.resendOtp(inputModel);
    result.fold(
      (failure) => emit(ResendOtpErrorState(error: failure.message)),
      (successModel) => emit(ResendOtpSuccessState(successModel)),
    );
  }
}