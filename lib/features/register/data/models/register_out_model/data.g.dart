// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  registrationToken: json['registration_token'] as String?,
  currentStep: json['current_step'] as num?,
  isVerified: json['is_verified'] as bool?,
  verificationType: json['verification_type'] as String?,
  otpRequired: json['otp_required'] as bool?,
  otpPurpose: json['otp_purpose'] as String?,
  maskedPhone: json['masked_phone'] as String?,
  expiresInSeconds: json['expires_in_seconds'] as num?,
  resendAfterSeconds: json['resend_after_seconds'] as num?,
  nextScreen: json['next_screen'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'registration_token': instance.registrationToken,
  'current_step': instance.currentStep,
  'is_verified': instance.isVerified,
  'verification_type': instance.verificationType,
  'otp_required': instance.otpRequired,
  'otp_purpose': instance.otpPurpose,
  'masked_phone': instance.maskedPhone,
  'expires_in_seconds': instance.expiresInSeconds,
  'resend_after_seconds': instance.resendAfterSeconds,
  'next_screen': instance.nextScreen,
};
