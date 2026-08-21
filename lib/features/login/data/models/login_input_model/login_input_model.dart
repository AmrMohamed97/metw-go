import 'package:json_annotation/json_annotation.dart';

part 'login_input_model.g.dart';

@JsonSerializable()
class LoginInputModel {
  String? phone;
  String? password;
  @JsonKey(name: 'device_token')
  String? deviceToken;

  LoginInputModel({this.phone, this.password, this.deviceToken});

  factory LoginInputModel.fromJson(Map<String, dynamic> json) {
    return _$LoginInputModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginInputModelToJson(this);
}
