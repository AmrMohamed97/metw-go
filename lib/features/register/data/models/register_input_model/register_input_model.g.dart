// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInputModel _$RegisterInputModelFromJson(Map<String, dynamic> json) =>
    RegisterInputModel(
      firstName: json['first_name'] as String?,
      fatherName: json['father_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      secondaryPhone: json['secondary_phone'] as String?,
      email: json['email'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      addressDetails: json['address_details'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$RegisterInputModelToJson(RegisterInputModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'father_name': instance.fatherName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'secondary_phone': instance.secondaryPhone,
      'email': instance.email,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'address_details': instance.addressDetails,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
