import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(InitialOtpState());

  void verifyOtp() {
    emit(OtpLoadingState());
    try {
    
    } catch (e) {
      emit(OtpErrorState(error: e.toString()));
    }
  }
}