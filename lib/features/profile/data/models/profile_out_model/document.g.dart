// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
  id: json['id'] as num?,
  documentType: json['document_type'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
  'id': instance.id,
  'document_type': instance.documentType,
  'url': instance.url,
};
