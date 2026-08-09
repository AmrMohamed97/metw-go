// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterOutModel _$RegisterOutModelFromJson(Map<String, dynamic> json) =>
    RegisterOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterOutModelToJson(RegisterOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
