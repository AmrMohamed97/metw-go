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
  @JsonKey(name: 'webview_url')
  final String? webviewUrl;
  @JsonKey(name: 'is_configured')
  final bool? isConfigured;

  PrivacyDataModel({this.title, this.webviewUrl, this.isConfigured});

  factory PrivacyDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyDataModelToJson(this);
}
