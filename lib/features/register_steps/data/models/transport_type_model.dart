import 'package:json_annotation/json_annotation.dart';

part 'transport_type_model.g.dart';

@JsonSerializable()
class TransportTypeModel {
  int? id;
  String? code;
  String? name;
  @JsonKey(name: 'max_weight_kg')
  num? maxWeightKg;
  @JsonKey(name: 'max_volume_m3')
  num? maxVolumeM3;

  TransportTypeModel({
    this.id,
    this.code,
    this.name,
    this.maxWeightKg,
    this.maxVolumeM3,
  });

  factory TransportTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TransportTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportTypeModelToJson(this);
}

@JsonSerializable()
class TransportTypeListResponse {
  bool? success;
  List<TransportTypeModel>? data;

  TransportTypeListResponse({this.success, this.data});

  factory TransportTypeListResponse.fromJson(Map<String, dynamic> json) =>
      _$TransportTypeListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransportTypeListResponseToJson(this);
}
