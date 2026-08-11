import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityListResponse {
  final bool? success;
  final String? message;
  final List<CityModel>? data;

  CityListResponse({this.success, this.message, this.data});

  factory CityListResponse.fromJson(Map<String, dynamic> json) =>
      _$CityListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityListResponseToJson(this);
}

@JsonSerializable()
class CityModel {
  final int? id;
  @JsonKey(name: 'governorate_id')
  final int? governorateId;
  final String? name;

  CityModel({this.id, this.governorateId, this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
