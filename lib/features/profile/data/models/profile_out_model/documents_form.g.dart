// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentsForm _$DocumentsFormFromJson(Map<String, dynamic> json) =>
    DocumentsForm(
      title: json['title'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String?,
      requiredDocuments: (json['required_documents'] as List<dynamic>?)
          ?.map((e) => RequiredDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploadedDocuments: (json['uploaded_documents'] as List<dynamic>?)
          ?.map((e) => UploadedDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      saveButtonLabel: json['save_button_label'] as String?,
    );

Map<String, dynamic> _$DocumentsFormToJson(DocumentsForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'profile_photo_url': instance.profilePhotoUrl,
      'required_documents': instance.requiredDocuments,
      'uploaded_documents': instance.uploadedDocuments,
      'save_button_label': instance.saveButtonLabel,
    };
