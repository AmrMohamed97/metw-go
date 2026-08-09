import 'package:json_annotation/json_annotation.dart';

part 'forget_password_out_model.g.dart';

@JsonSerializable()
class ForgetPasswordOutModel {
  bool? success;
  String? message;
  ForgetPasswordData? data;

  ForgetPasswordOutModel({this.success, this.message, this.data});

  factory ForgetPasswordOutModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordOutModelToJson(this);
}

@JsonSerializable()
class ForgetPasswordData {
  @JsonKey(name: 'masked_phone')
  String? maskedPhone;
  @JsonKey(name: 'expires_in_seconds')
  int? expiresInSeconds;
  @JsonKey(name: 'resend_after_seconds')
  int? resendAfterSeconds;
  @JsonKey(name: 'next_screen')
  String? nextScreen;

  ForgetPasswordData({
    this.maskedPhone,
    this.expiresInSeconds,
    this.resendAfterSeconds,
    this.nextScreen,
  });

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordDataToJson(this);
}
