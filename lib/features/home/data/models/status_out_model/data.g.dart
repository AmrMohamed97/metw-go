// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  availabilityStatus: json['availability_status'] as String?,
  onlineStartedAt: json['online_started_at'] as String?,
  onlineDurationSeconds: json['online_duration_seconds'] as num?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'availability_status': instance.availabilityStatus,
  'online_started_at': instance.onlineStartedAt,
  'online_duration_seconds': instance.onlineDurationSeconds,
};
