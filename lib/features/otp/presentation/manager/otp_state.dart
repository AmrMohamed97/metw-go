abstract class OtpState {}

class InitialOtpState extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpSuccessState extends OtpState {}

class OtpErrorState extends OtpState {
  final String error;
  OtpErrorState({required this.error});
}
