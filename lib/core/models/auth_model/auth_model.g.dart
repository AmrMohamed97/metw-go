// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  status: json['status'] as String?,
  isVerified: json['is_verified'] as bool?,
  currentStep: json['current_step'] as num?,
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'status': instance.status,
  'is_verified': instance.isVerified,
  'current_step': instance.currentStep,
};
