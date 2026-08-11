import 'package:json_annotation/json_annotation.dart';

part 'governorate_model.g.dart';

@JsonSerializable()
class GovernorateListResponse {
  final bool? success;
  final String? message;
  final List<GovernorateModel>? data;

  GovernorateListResponse({this.success, this.message, this.data});

  factory GovernorateListResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernorateListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateListResponseToJson(this);
}

@JsonSerializable()
class GovernorateModel {
  final int? id;
  final String? name;

  GovernorateModel({this.id, this.name});

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernorateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateModelToJson(this);
}
