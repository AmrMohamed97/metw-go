// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Signature _$SignatureFromJson(Map<String, dynamic> json) => Signature(
  title: json['title'] as String?,
  label: json['label'] as String?,
  resetLabel: json['reset_label'] as String?,
  value: json['value'] as String?,
  isCompleted: json['is_completed'] as bool?,
  placeholder: json['placeholder'] as String?,
);

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
  'title': instance.title,
  'label': instance.label,
  'reset_label': instance.resetLabel,
  'value': instance.value,
  'is_completed': instance.isCompleted,
  'placeholder': instance.placeholder,
};
