import 'package:json_annotation/json_annotation.dart';

part 'forget_password_input_model.g.dart';

@JsonSerializable()
class ForgetPasswordInputModel {
  String? phone;

  ForgetPasswordInputModel({this.phone});

  factory ForgetPasswordInputModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordInputModelToJson(this);
}
