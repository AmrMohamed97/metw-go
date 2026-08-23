// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsSection _$SettingsSectionFromJson(Map<String, dynamic> json) =>
    SettingsSection(
      key: json['key'] as String?,
      label: json['label'] as String?,
      enabled: json['enabled'] as bool?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$SettingsSectionToJson(SettingsSection instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'enabled': instance.enabled,
      'value': instance.value,
    };
