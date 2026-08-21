// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
  key: json['key'] as String?,
  label: json['label'] as String?,
  location: json['location'] as String?,
  at: json['at'] as String?,
  timeLabel: json['time_label'] as String?,
  isCompleted: json['is_completed'] as bool?,
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'location': instance.location,
  'at': instance.at,
  'time_label': instance.timeLabel,
  'is_completed': instance.isCompleted,
};
