// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedDocument _$UploadedDocumentFromJson(Map<String, dynamic> json) =>
    UploadedDocument(
      id: json['id'] as num?,
      documentType: json['document_type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UploadedDocumentToJson(UploadedDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_type': instance.documentType,
      'url': instance.url,
    };
