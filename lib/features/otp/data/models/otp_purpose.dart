enum OtpPurpose {
  registration('registration'),
  forgotPassword('forgot_password'),
  phoneVerification('phone_verification'),
  secondaryPhoneVerification('secondary_phone_verification');

  final String value;
  const OtpPurpose(this.value);

  static OtpPurpose fromString(String value) {
    return OtpPurpose.values.firstWhere(
      (element) => element.value == value,
      orElse: () => OtpPurpose.secondaryPhoneVerification,
    );
  }
}
