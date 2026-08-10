// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportTypeModel _$TransportTypeModelFromJson(Map<String, dynamic> json) =>
    TransportTypeModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      maxWeightKg: json['max_weight_kg'] as num?,
      maxVolumeM3: json['max_volume_m3'] as num?,
    );

Map<String, dynamic> _$TransportTypeModelToJson(TransportTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'max_weight_kg': instance.maxWeightKg,
      'max_volume_m3': instance.maxVolumeM3,
    };

TransportTypeListResponse _$TransportTypeListResponseFromJson(
  Map<String, dynamic> json,
) => TransportTypeListResponse(
  success: json['success'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => TransportTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TransportTypeListResponseToJson(
  TransportTypeListResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
