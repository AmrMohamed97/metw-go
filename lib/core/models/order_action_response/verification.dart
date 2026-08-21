import 'package:json_annotation/json_annotation.dart';

part 'verification.g.dart';

@JsonSerializable()
class Verification {
  String? title;
  String? hint;
  @JsonKey(name: 'otp_length')
  num? otpLength;
  @JsonKey(name: 'digit_placeholder')
  String? digitPlaceholder;

  Verification({this.title, this.hint, this.otpLength, this.digitPlaceholder});

  factory Verification.fromJson(Map<String, dynamic> json) {
    return _$VerificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
