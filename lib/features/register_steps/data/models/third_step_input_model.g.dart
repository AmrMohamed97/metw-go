// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_step_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdStepInputModel _$ThirdStepInputModelFromJson(Map<String, dynamic> json) =>
    ThirdStepInputModel(
      governorateIds: (json['governorate_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      cityIds: (json['city_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      villagesServiceEnabled: json['villages_service_enabled'] as bool,
    );

Map<String, dynamic> _$ThirdStepInputModelToJson(
  ThirdStepInputModel instance,
) => <String, dynamic>{
  'governorate_ids': instance.governorateIds,
  'city_ids': instance.cityIds,
  'villages_service_enabled': instance.villagesServiceEnabled,
};
