// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChecklistStep _$ChecklistStepFromJson(Map<String, dynamic> json) =>
    ChecklistStep(
      key: json['key'] as String?,
      label: json['label'] as String?,
      completed: json['completed'] as bool?,
      required: json['required'] as bool?,
    );

Map<String, dynamic> _$ChecklistStepToJson(ChecklistStep instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'completed': instance.completed,
      'required': instance.required,
    };
