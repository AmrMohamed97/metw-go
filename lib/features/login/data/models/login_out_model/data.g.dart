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
  nextScreen: json['next_screen'] as String?,
  accessToken: json['access_token'] as String?,
  tokenType: json['token_type'] as String?,
  registrationProgress: json['registration_progress'] == null
      ? null
      : RegistrationProgress.fromJson(
          json['registration_progress'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'screen': instance.screen,
  'code': instance.code,
  'status': instance.status,
  'next_action': instance.nextAction,
  'next_screen': instance.nextScreen,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'registration_progress': instance.registrationProgress,
};
