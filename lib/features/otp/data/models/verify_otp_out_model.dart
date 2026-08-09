import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_out_model.g.dart';

@JsonSerializable()
class VerifyOtpOutModel {
  bool? success;
  String? message;
  VerifyOtpData? data;

  VerifyOtpOutModel({this.success, this.message, this.data});

  factory VerifyOtpOutModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpOutModelToJson(this);
}

@JsonSerializable()
class VerifyOtpData {
  String? purpose;
  @JsonKey(name: 'next_screen')
  String? nextScreen;
  @JsonKey(name: 'reset_token')
  String? resetToken;

  VerifyOtpData({this.purpose, this.nextScreen, this.resetToken});

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpDataToJson(this);
}
