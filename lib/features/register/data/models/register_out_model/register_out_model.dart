import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register_out_model.g.dart';

@JsonSerializable()
class RegisterOutModel {
  bool? success;
  String? message;
  Data? data;

  RegisterOutModel({this.success, this.message, this.data});

  factory RegisterOutModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterOutModelToJson(this);
}
