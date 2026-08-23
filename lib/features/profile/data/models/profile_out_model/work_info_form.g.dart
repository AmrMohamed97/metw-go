// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_info_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkInfoForm _$WorkInfoFormFromJson(Map<String, dynamic> json) => WorkInfoForm(
  title: json['title'] as String?,
  courierType: json['courier_type'] as String?,
  courierTypeOptions: (json['courier_type_options'] as List<dynamic>?)
      ?.map((e) => CourierTypeOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  workTypes: (json['work_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workTypeOptions: (json['work_type_options'] as List<dynamic>?)
      ?.map((e) => WorkTypeOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  warehouseId: json['warehouse_id'] as num?,
  saveButtonLabel: json['save_button_label'] as String?,
);

Map<String, dynamic> _$WorkInfoFormToJson(WorkInfoForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'courier_type': instance.courierType,
      'courier_type_options': instance.courierTypeOptions,
      'work_types': instance.workTypes,
      'work_type_options': instance.workTypeOptions,
      'warehouse_id': instance.warehouseId,
      'save_button_label': instance.saveButtonLabel,
    };
