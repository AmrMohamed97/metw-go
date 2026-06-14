// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  lname: json['lname'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String,
  img: json['img'] as String,
  type: json['type'] as String,
  roleId: (json['role_id'] as num).toInt(),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'lname': instance.lname,
  'email': instance.email,
  'phone': instance.phone,
  'img': instance.img,
  'type': instance.type,
  'role_id': instance.roleId,
};
