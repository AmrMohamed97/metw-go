// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusOutModel _$StatusOutModelFromJson(Map<String, dynamic> json) =>
    StatusOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatusOutModelToJson(StatusOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
