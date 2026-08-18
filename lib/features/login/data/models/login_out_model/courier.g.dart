// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Courier _$CourierFromJson(Map<String, dynamic> json) => Courier(
  id: (json['id'] as num?)?.toInt(),
  accountNumber: json['account_number'] as String?,
  accountOpenedAt: json['account_opened_at'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  approvalStatus: json['approval_status'] as String?,
  isProfileComplete: json['is_profile_complete'] as bool?,
  avatar: json['avatar'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  availabilityStatus: json['availability_status'] as String?,
  onlineDurationSeconds: (json['online_duration_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$CourierToJson(Courier instance) => <String, dynamic>{
  'id': instance.id,
  'account_number': instance.accountNumber,
  'account_opened_at': instance.accountOpenedAt,
  'name': instance.name,
  'phone': instance.phone,
  'approval_status': instance.approvalStatus,
  'is_profile_complete': instance.isProfileComplete,
  'avatar': instance.avatar,
  'rating': instance.rating,
  'availability_status': instance.availabilityStatus,
  'online_duration_seconds': instance.onlineDurationSeconds,
};
