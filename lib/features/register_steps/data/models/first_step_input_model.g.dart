// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_step_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstStepInputModel _$FirstStepInputModelFromJson(Map<String, dynamic> json) =>
    FirstStepInputModel(
      courierType: json['courier_type'] as String,
      warehouseId: (json['warehouse_id'] as num?)?.toInt(),
      workTypes: (json['work_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FirstStepInputModelToJson(
  FirstStepInputModel instance,
) => <String, dynamic>{
  'courier_type': instance.courierType,
  'warehouse_id': instance.warehouseId,
  'work_types': instance.workTypes,
};
