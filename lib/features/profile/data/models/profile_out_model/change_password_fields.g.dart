// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordFields _$ChangePasswordFieldsFromJson(
  Map<String, dynamic> json,
) => ChangePasswordFields(
  currentPasswordLabel: json['current_password_label'] as String?,
  newPasswordLabel: json['new_password_label'] as String?,
  newPasswordConfirmationLabel:
      json['new_password_confirmation_label'] as String?,
  endpoint: json['endpoint'] as String?,
);

Map<String, dynamic> _$ChangePasswordFieldsToJson(
  ChangePasswordFields instance,
) => <String, dynamic>{
  'current_password_label': instance.currentPasswordLabel,
  'new_password_label': instance.newPasswordLabel,
  'new_password_confirmation_label': instance.newPasswordConfirmationLabel,
  'endpoint': instance.endpoint,
};
