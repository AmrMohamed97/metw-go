import 'package:json_annotation/json_annotation.dart';

part 'warehouse_model.g.dart';

@JsonSerializable()
class WarehouseModel {
  int? id;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  String? name;

  WarehouseModel({this.id, this.accountNumber, this.name});

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);
}

@JsonSerializable()
class WarehouseListResponse {
  bool? success;
  String? message;
  List<WarehouseModel>? data;

  WarehouseListResponse({this.success, this.message, this.data});

  factory WarehouseListResponse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseListResponseToJson(this);
}
