// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpOutModel _$VerifyOtpOutModelFromJson(Map<String, dynamic> json) =>
    VerifyOtpOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : VerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpOutModelToJson(VerifyOtpOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

VerifyOtpData _$VerifyOtpDataFromJson(Map<String, dynamic> json) =>
    VerifyOtpData(
      purpose: json['purpose'] as String?,
      nextScreen: json['next_screen'] as String?,
      resetToken: json['reset_token'] as String?,
    );

Map<String, dynamic> _$VerifyOtpDataToJson(VerifyOtpData instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'next_screen': instance.nextScreen,
      'reset_token': instance.resetToken,
    };
