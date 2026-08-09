import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_input_model.g.dart';

@JsonSerializable()
class VerifyOtpInputModel {
  String? phone;
  String? otp;
  String? purpose;

  VerifyOtpInputModel({this.phone, this.otp, this.purpose});

  factory VerifyOtpInputModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpInputModelToJson(this);
}
