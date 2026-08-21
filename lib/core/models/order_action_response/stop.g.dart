// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
  type: json['type'] as String?,
  title: json['title'] as String?,
  name: json['name'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  markerColor: json['marker_color'] as String?,
  markerLabel: json['marker_label'],
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'name': instance.name,
  'address': instance.address,
  'phone': instance.phone,
  'marker_color': instance.markerColor,
  'marker_label': instance.markerLabel,
  'actions': instance.actions,
};
