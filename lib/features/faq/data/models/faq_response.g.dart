// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) => FaqResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : FaqDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FaqResponseToJson(FaqResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

FaqDataModel _$FaqDataModelFromJson(Map<String, dynamic> json) => FaqDataModel(
  title: json['title'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => FaqItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isConfigured: json['is_configured'] as bool?,
);

Map<String, dynamic> _$FaqDataModelToJson(FaqDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items,
      'is_configured': instance.isConfigured,
    };

FaqItemModel _$FaqItemModelFromJson(Map<String, dynamic> json) => FaqItemModel(
  question: json['question'] as String?,
  answer: json['answer'] as String?,
);

Map<String, dynamic> _$FaqItemModelToJson(FaqItemModel instance) =>
    <String, dynamic>{'question': instance.question, 'answer': instance.answer};
