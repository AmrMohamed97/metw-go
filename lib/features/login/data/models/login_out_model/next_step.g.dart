// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextStep _$NextStepFromJson(Map<String, dynamic> json) => NextStep(
  number: json['number'] as num?,
  key: json['key'] as String?,
  route: json['route'] as String?,
  apiEndpoint: json['api_endpoint'] as String?,
);

Map<String, dynamic> _$NextStepToJson(NextStep instance) => <String, dynamic>{
  'number': instance.number,
  'key': instance.key,
  'route': instance.route,
  'api_endpoint': instance.apiEndpoint,
};
