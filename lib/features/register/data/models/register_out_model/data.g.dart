// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  registrationToken: json['registration_token'] as String?,
  currentStep: json['current_step'] as num?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'registration_token': instance.registrationToken,
  'current_step': instance.currentStep,
};
