// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileOutModel _$ProfileOutModelFromJson(Map<String, dynamic> json) =>
    ProfileOutModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileOutModelToJson(ProfileOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
