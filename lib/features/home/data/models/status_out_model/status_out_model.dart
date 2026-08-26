import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'status_out_model.g.dart';

@JsonSerializable()
class StatusOutModel {
  bool? success;
  String? message;
  Data? data;

  StatusOutModel({this.success, this.message, this.data});

  factory StatusOutModel.fromJson(Map<String, dynamic> json) {
    return _$StatusOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusOutModelToJson(this);
}
