import 'package:json_annotation/json_annotation.dart';

part 'return_reasons_response.g.dart';

@JsonSerializable()
class ReturnReasonsResponse {
  final bool? success;
  final String? message;
  final ReturnReasonsDataModel? data;

  ReturnReasonsResponse({this.success, this.message, this.data});

  factory ReturnReasonsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReturnReasonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnReasonsResponseToJson(this);
}

@JsonSerializable()
class ReturnReasonsDataModel {
  final List<ReasonItemModel>? reasons;

  ReturnReasonsDataModel({this.reasons});

  factory ReturnReasonsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnReasonsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnReasonsDataModelToJson(this);
}

@JsonSerializable()
class ReasonItemModel {
  final int? id;
  @JsonKey(name: 'reason_text')
  final String? reasonText;
  @JsonKey(name: 'is_active')
  final int? isActive;

  ReasonItemModel({this.id, this.reasonText, this.isActive});

  factory ReasonItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReasonItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonItemModelToJson(this);
}
