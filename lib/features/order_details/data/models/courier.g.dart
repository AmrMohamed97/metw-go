// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Courier _$CourierFromJson(Map<String, dynamic> json) => Courier(
  id: (json['id'] as num?)?.toInt(),
  accountNumber: json['account_number'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  avatar: json['avatar'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  availabilityStatus: json['availability_status'] as String?,
  isProfileComplete: json['is_profile_complete'] as bool?,
);

Map<String, dynamic> _$CourierToJson(Courier instance) => <String, dynamic>{
  'id': instance.id,
  'account_number': instance.accountNumber,
  'name': instance.name,
  'phone': instance.phone,
  'avatar': instance.avatar,
  'rating': instance.rating,
  'availability_status': instance.availabilityStatus,
  'is_profile_complete': instance.isProfileComplete,
};
