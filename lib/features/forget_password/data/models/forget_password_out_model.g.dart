// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordOutModel _$ForgetPasswordOutModelFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordOutModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ForgetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForgetPasswordOutModelToJson(
  ForgetPasswordOutModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ForgetPasswordData _$ForgetPasswordDataFromJson(Map<String, dynamic> json) =>
    ForgetPasswordData(
      maskedPhone: json['masked_phone'] as String?,
      expiresInSeconds: (json['expires_in_seconds'] as num?)?.toInt(),
      resendAfterSeconds: (json['resend_after_seconds'] as num?)?.toInt(),
      nextScreen: json['next_screen'] as String?,
    );

Map<String, dynamic> _$ForgetPasswordDataToJson(ForgetPasswordData instance) =>
    <String, dynamic>{
      'masked_phone': instance.maskedPhone,
      'expires_in_seconds': instance.expiresInSeconds,
      'resend_after_seconds': instance.resendAfterSeconds,
      'next_screen': instance.nextScreen,
    };
