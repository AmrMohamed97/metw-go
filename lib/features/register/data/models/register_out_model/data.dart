import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'registration_token')
  String? registrationToken;
  @JsonKey(name: 'current_step')
  num? currentStep;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'verification_type')
  String? verificationType;
  @JsonKey(name: 'otp_required')
  bool? otpRequired;
  @JsonKey(name: 'otp_purpose')
  String? otpPurpose;
  @JsonKey(name: 'masked_phone')
  String? maskedPhone;
  @JsonKey(name: 'expires_in_seconds')
  num? expiresInSeconds;
  @JsonKey(name: 'resend_after_seconds')
  num? resendAfterSeconds;
  @JsonKey(name: 'next_screen')
  String? nextScreen;

  Data({
    this.registrationToken,
    this.currentStep,
    this.isVerified,
    this.verificationType,
    this.otpRequired,
    this.otpPurpose,
    this.maskedPhone,
    this.expiresInSeconds,
    this.resendAfterSeconds,
    this.nextScreen,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
