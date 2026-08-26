// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeOutModel _$HomeOutModelFromJson(Map<String, dynamic> json) => HomeOutModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeOutModelToJson(HomeOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
