// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  isAuthorized: json['is_authorized'] as bool?,
  isVerified: json['is_verified'] as bool?,
  currentStep: json['current_step'] as num?,
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'is_authorized': instance.isAuthorized,
  'is_verified': instance.isVerified,
  'current_step': instance.currentStep,
};
