// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
  title: json['title'] as String?,
  hint: json['hint'] as String?,
  otpLength: json['otp_length'] as num?,
  digitPlaceholder: json['digit_placeholder'] as String?,
);

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'hint': instance.hint,
      'otp_length': instance.otpLength,
      'digit_placeholder': instance.digitPlaceholder,
    };
