// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  number: json['number'] as num?,
  key: json['key'] as String?,
  route: json['route'] as String?,
  apiEndpoint: json['api_endpoint'] as String?,
  isCompleted: json['is_completed'] as bool?,
);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
  'number': instance.number,
  'key': instance.key,
  'route': instance.route,
  'api_endpoint': instance.apiEndpoint,
  'is_completed': instance.isCompleted,
};
