// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProofPhoto _$ProofPhotoFromJson(Map<String, dynamic> json) => ProofPhoto(
  title: json['title'] as String?,
  label: json['label'] as String?,
  placeholder: json['placeholder'] as String?,
  url: json['url'] as String?,
  isUploaded: json['is_uploaded'] as bool?,
);

Map<String, dynamic> _$ProofPhotoToJson(ProofPhoto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'label': instance.label,
      'placeholder': instance.placeholder,
      'url': instance.url,
      'is_uploaded': instance.isUploaded,
    };
