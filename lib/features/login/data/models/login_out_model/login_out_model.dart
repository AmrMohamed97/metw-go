import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_out_model.g.dart';

@JsonSerializable()
class LoginOutModel {
  bool? success;
  String? message;
  Data? data;

  LoginOutModel({this.success, this.message, this.data});

  factory LoginOutModel.fromJson(Map<String, dynamic> json) {
    return _$LoginOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginOutModelToJson(this);
}
