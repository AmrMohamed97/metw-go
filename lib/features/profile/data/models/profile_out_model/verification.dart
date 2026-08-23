import 'package:json_annotation/json_annotation.dart';

part 'verification.g.dart';

@JsonSerializable()
class Verification {
  @JsonKey(name: 'phone_verified')
  bool? phoneVerified;
  @JsonKey(name: 'phone_verified_at')
  dynamic phoneVerifiedAt;
  @JsonKey(name: 'secondary_phone_verified')
  bool? secondaryPhoneVerified;
  @JsonKey(name: 'secondary_phone_verified_at')
  dynamic secondaryPhoneVerifiedAt;
  @JsonKey(name: 'email_verified')
  bool? emailVerified;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;

  Verification({
    this.phoneVerified,
    this.phoneVerifiedAt,
    this.secondaryPhoneVerified,
    this.secondaryPhoneVerifiedAt,
    this.emailVerified,
    this.emailVerifiedAt,
  });

  factory Verification.fromJson(Map<String, dynamic> json) {
    return _$VerificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
