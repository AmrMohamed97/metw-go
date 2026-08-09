// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInputModel _$LoginInputModelFromJson(Map<String, dynamic> json) =>
    LoginInputModel(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      deviceToken: json['device_token'] as String?,
    );

Map<String, dynamic> _$LoginInputModelToJson(LoginInputModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'device_token': instance.deviceToken,
    };
