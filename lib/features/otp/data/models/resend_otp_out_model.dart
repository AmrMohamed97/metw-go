import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_out_model.g.dart';

@JsonSerializable()
class ResendOtpOutModel {
  bool? success;
  String? message;
  ResendOtpData? data;

  ResendOtpOutModel({this.success, this.message, this.data});

  factory ResendOtpOutModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpOutModelToJson(this);
}

@JsonSerializable()
class ResendOtpData {
  @JsonKey(name: 'expires_in_seconds')
  int? expiresInSeconds;
  @JsonKey(name: 'resend_after_seconds')
  int? resendAfterSeconds;

  ResendOtpData({this.expiresInSeconds, this.resendAfterSeconds});

  factory ResendOtpData.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpDataToJson(this);
}
