// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOutModel _$LoginOutModelFromJson(Map<String, dynamic> json) =>
    LoginOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginOutModelToJson(LoginOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
