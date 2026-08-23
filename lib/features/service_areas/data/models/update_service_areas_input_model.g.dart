// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_service_areas_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateServiceAreasInputModel _$UpdateServiceAreasInputModelFromJson(
  Map<String, dynamic> json,
) => UpdateServiceAreasInputModel(
  governorateIds: (json['governorate_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  cityIds: (json['city_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  villagesServiceEnabled: json['villages_service_enabled'] as bool,
);

Map<String, dynamic> _$UpdateServiceAreasInputModelToJson(
  UpdateServiceAreasInputModel instance,
) => <String, dynamic>{
  'governorate_ids': instance.governorateIds,
  'city_ids': instance.cityIds,
  'villages_service_enabled': instance.villagesServiceEnabled,
};
