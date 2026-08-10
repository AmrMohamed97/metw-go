// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_step_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstStepOutModel _$FirstStepOutModelFromJson(Map<String, dynamic> json) =>
    FirstStepOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FirstStepOutModelToJson(FirstStepOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
