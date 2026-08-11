// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernorateListResponse _$GovernorateListResponseFromJson(
  Map<String, dynamic> json,
) => GovernorateListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GovernorateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GovernorateListResponseToJson(
  GovernorateListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
