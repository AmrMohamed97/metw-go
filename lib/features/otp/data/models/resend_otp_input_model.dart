import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_input_model.g.dart';

@JsonSerializable()
class ResendOtpInputModel {
  String? phone;
  String? purpose;

  ResendOtpInputModel({this.phone, this.purpose});

  factory ResendOtpInputModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpInputModelToJson(this);
}
