// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_reasons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnReasonsResponse _$ReturnReasonsResponseFromJson(
  Map<String, dynamic> json,
) => ReturnReasonsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ReasonItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReturnReasonsResponseToJson(
  ReturnReasonsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ReasonItemModel _$ReasonItemModelFromJson(Map<String, dynamic> json) =>
    ReasonItemModel(
      id: (json['id'] as num?)?.toInt(),
      reasonText: json['reason_text'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReasonItemModelToJson(ReasonItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason_text': instance.reasonText,
      'is_active': instance.isActive,
    };
