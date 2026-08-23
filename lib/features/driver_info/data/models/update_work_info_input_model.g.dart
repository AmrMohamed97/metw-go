// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_work_info_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateWorkInfoInputModel _$UpdateWorkInfoInputModelFromJson(
  Map<String, dynamic> json,
) => UpdateWorkInfoInputModel(
  courierType: json['courier_type'] as String,
  warehouseId: (json['warehouse_id'] as num?)?.toInt(),
  workTypes: (json['work_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateWorkInfoInputModelToJson(
  UpdateWorkInfoInputModel instance,
) => <String, dynamic>{
  'courier_type': instance.courierType,
  'warehouse_id': instance.warehouseId,
  'work_types': instance.workTypes,
};
