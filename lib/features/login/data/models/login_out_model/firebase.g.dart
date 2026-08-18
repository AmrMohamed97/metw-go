// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Firebase _$FirebaseFromJson(Map<String, dynamic> json) => Firebase(
  authStatus: json['auth_status'] as String?,
  isAuthorized: json['is_authorized'] as bool?,
  deviceTokenSaved: json['device_token_saved'] as bool?,
);

Map<String, dynamic> _$FirebaseToJson(Firebase instance) => <String, dynamic>{
  'auth_status': instance.authStatus,
  'is_authorized': instance.isAuthorized,
  'device_token_saved': instance.deviceTokenSaved,
};
