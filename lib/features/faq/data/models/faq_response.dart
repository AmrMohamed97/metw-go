import 'package:json_annotation/json_annotation.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FaqResponse {
  final bool? success;
  final String? message;
  final FaqDataModel? data;

  FaqResponse({this.success, this.message, this.data});

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
}

@JsonSerializable()
class FaqDataModel {
  final String? title;
  final List<FaqItemModel>? items;
  @JsonKey(name: 'is_configured')
  final bool? isConfigured;

  FaqDataModel({this.title, this.items, this.isConfigured});

  factory FaqDataModel.fromJson(Map<String, dynamic> json) =>
      _$FaqDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqDataModelToJson(this);
}

@JsonSerializable()
class FaqItemModel {
  final String? question;
  final String? answer;

  FaqItemModel({this.question, this.answer});

  factory FaqItemModel.fromJson(Map<String, dynamic> json) =>
      _$FaqItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqItemModelToJson(this);
}
