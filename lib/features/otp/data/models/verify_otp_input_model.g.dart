// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpInputModel _$VerifyOtpInputModelFromJson(Map<String, dynamic> json) =>
    VerifyOtpInputModel(
      phone: json['phone'] as String?,
      otp: json['otp'] as String?,
      purpose: json['purpose'] as String?,
    );

Map<String, dynamic> _$VerifyOtpInputModelToJson(
  VerifyOtpInputModel instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'otp': instance.otp,
  'purpose': instance.purpose,
};
