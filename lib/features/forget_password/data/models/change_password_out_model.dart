import 'package:json_annotation/json_annotation.dart';

part 'change_password_out_model.g.dart';

@JsonSerializable()
class ChangePasswordOutModel {
  bool? success;
  String? message;

  ChangePasswordOutModel({this.success, this.message});

  factory ChangePasswordOutModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordOutModelToJson(this);
}
