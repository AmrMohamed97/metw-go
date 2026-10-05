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
      url: json['url'] as String?,
      webviewUrl: json['webview_url'] as String?,
      body: json['body'] as String?,
      content: json['content'] as String?,
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => PrivacyBlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isConfigured: json['is_configured'] as bool?,
    );

Map<String, dynamic> _$PrivacyDataModelToJson(PrivacyDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'webview_url': instance.webviewUrl,
      'body': instance.body,
      'content': instance.content,
      'blocks': instance.blocks,
      'is_configured': instance.isConfigured,
    };

PrivacyBlockModel _$PrivacyBlockModelFromJson(Map<String, dynamic> json) =>
    PrivacyBlockModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$PrivacyBlockModelToJson(PrivacyBlockModel instance) =>
    <String, dynamic>{'title': instance.title, 'body': instance.body};
