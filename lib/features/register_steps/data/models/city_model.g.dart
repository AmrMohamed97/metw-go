// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListResponse _$CityListResponseFromJson(Map<String, dynamic> json) =>
    CityListResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListResponseToJson(CityListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  governorateId: (json['governorate_id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'governorate_id': instance.governorateId,
  'name': instance.name,
};
