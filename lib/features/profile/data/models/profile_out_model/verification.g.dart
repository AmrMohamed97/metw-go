// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
  phoneVerified: json['phone_verified'] as bool?,
  phoneVerifiedAt: json['phone_verified_at'],
  secondaryPhoneVerified: json['secondary_phone_verified'] as bool?,
  secondaryPhoneVerifiedAt: json['secondary_phone_verified_at'],
  emailVerified: json['email_verified'] as bool?,
  emailVerifiedAt: json['email_verified_at'] as String?,
);

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'phone_verified': instance.phoneVerified,
      'phone_verified_at': instance.phoneVerifiedAt,
      'secondary_phone_verified': instance.secondaryPhoneVerified,
      'secondary_phone_verified_at': instance.secondaryPhoneVerifiedAt,
      'email_verified': instance.emailVerified,
      'email_verified_at': instance.emailVerifiedAt,
    };
