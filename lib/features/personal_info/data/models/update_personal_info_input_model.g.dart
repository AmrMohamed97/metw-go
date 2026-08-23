// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_personal_info_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePersonalInfoInputModel _$UpdatePersonalInfoInputModelFromJson(
  Map<String, dynamic> json,
) => UpdatePersonalInfoInputModel(
  firstName: json['first_name'] as String?,
  fatherName: json['father_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  secondaryPhone: json['secondary_phone'] as String?,
  email: json['email'] as String?,
  birthDate: json['birth_date'] as String?,
  gender: json['gender'] as String?,
  addressDetails: json['address_details'] as String?,
);

Map<String, dynamic> _$UpdatePersonalInfoInputModelToJson(
  UpdatePersonalInfoInputModel instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'father_name': instance.fatherName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'secondary_phone': instance.secondaryPhone,
  'email': instance.email,
  'birth_date': instance.birthDate,
  'gender': instance.gender,
  'address_details': instance.addressDetails,
};
