// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  screen: json['screen'] as String?,
  code: json['code'] as String?,
  status: json['status'] as String?,
  nextAction: json['next_action'] as String?,
  isVerified: json['is_verified'] as bool?,
  verificationType: json['verification_type'] as String?,
  maskedPhone: json['masked_phone'] as String?,
  nextScreen: json['next_screen'] as String?,
  accessToken: json['access_token'] as String?,
  tokenType: json['token_type'] as String?,
  registrationProgress: json['registration_progress'] == null
      ? null
      : RegistrationProgress.fromJson(
          json['registration_progress'] as Map<String, dynamic>,
        ),
  isAuthorized: json['is_authorized'] as bool?,
  courier: json['courier'] == null
      ? null
      : Courier.fromJson(json['courier'] as Map<String, dynamic>),
  firebase: json['firebase'] == null
      ? null
      : Firebase.fromJson(json['firebase'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'screen': instance.screen,
  'code': instance.code,
  'status': instance.status,
  'next_action': instance.nextAction,
  'is_verified': instance.isVerified,
  'verification_type': instance.verificationType,
  'masked_phone': instance.maskedPhone,
  'next_screen': instance.nextScreen,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'registration_progress': instance.registrationProgress,
  'is_authorized': instance.isAuthorized,
  'courier': instance.courier,
  'firebase': instance.firebase,
};
