// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpOutModel _$ResendOtpOutModelFromJson(Map<String, dynamic> json) =>
    ResendOtpOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ResendOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResendOtpOutModelToJson(ResendOtpOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ResendOtpData _$ResendOtpDataFromJson(Map<String, dynamic> json) =>
    ResendOtpData(
      expiresInSeconds: (json['expires_in_seconds'] as num?)?.toInt(),
      resendAfterSeconds: (json['resend_after_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResendOtpDataToJson(ResendOtpData instance) =>
    <String, dynamic>{
      'expires_in_seconds': instance.expiresInSeconds,
      'resend_after_seconds': instance.resendAfterSeconds,
    };
