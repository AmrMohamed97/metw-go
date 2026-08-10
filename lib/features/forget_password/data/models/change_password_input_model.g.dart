// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordInputModel _$ChangePasswordInputModelFromJson(
  Map<String, dynamic> json,
) => ChangePasswordInputModel(
  password: json['password'] as String?,
  passwordConfirmation: json['password_confirmation'] as String?,
);

Map<String, dynamic> _$ChangePasswordInputModelToJson(
  ChangePasswordInputModel instance,
) => <String, dynamic>{
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};
