// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyResponse _$PrivacyResponseFromJson(Map<String, dynamic> json) =>
    PrivacyResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PrivacyDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivacyResponseToJson(PrivacyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

PrivacyDataModel _$PrivacyDataModelFromJson(Map<String, dynamic> json) =>
    PrivacyDataModel(
      title: json['title'] as String?,
      webviewUrl: json['webview_url'] as String?,
      isConfigured: json['is_configured'] as bool?,
    );

Map<String, dynamic> _$PrivacyDataModelToJson(PrivacyDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'webview_url': instance.webviewUrl,
      'is_configured': instance.isConfigured,
    };
