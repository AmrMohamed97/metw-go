import 'package:json_annotation/json_annotation.dart';

part 'privacy_response.g.dart';

@JsonSerializable()
class PrivacyResponse {
  final bool? success;
  final String? message;
  final PrivacyDataModel? data;

  PrivacyResponse({this.success, this.message, this.data});

  factory PrivacyResponse.fromJson(Map<String, dynamic> json) =>
      _$PrivacyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyResponseToJson(this);
}

@JsonSerializable()
class PrivacyDataModel {
  final String? title;
  final String? url;
  @JsonKey(name: 'webview_url')
  final String? webviewUrl;
  final String? body;
  final String? content;
  final List<PrivacyBlockModel>? blocks;
  @JsonKey(name: 'is_configured')
  final bool? isConfigured;

  PrivacyDataModel({
    this.title,
    this.url,
    this.webviewUrl,
    this.body,
    this.content,
    this.blocks,
    this.isConfigured,
  });

  /// The active URL to load (url or webviewUrl)
  String? get effectiveUrl =>
      (url != null && url!.isNotEmpty) ? url : webviewUrl;

  /// The active HTML content (body or content)
  String? get effectiveHtml =>
      (body != null && body!.isNotEmpty) ? body : content;

  factory PrivacyDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyDataModelToJson(this);
}

@JsonSerializable()
class PrivacyBlockModel {
  final String? title;
  final String? body;

  PrivacyBlockModel({this.title, this.body});

  factory PrivacyBlockModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyBlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyBlockModelToJson(this);
}
