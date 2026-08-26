// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lifecycle _$LifecycleFromJson(Map<String, dynamic> json) => Lifecycle(
  currentStage: json['current_stage'] as String?,
  arrivedPickupAt: json['arrived_pickup_at'],
  pickupConfirmedAt: json['pickup_confirmed_at'],
  arrivedDropoffAt: json['arrived_dropoff_at'],
  deliveredAt: json['delivered_at'],
  proofPhotoUrl: json['proof_photo_url'],
  signature: json['signature'],
  checklist: json['checklist'],
  recipientName: json['recipient_name'],
  deliveryNote: json['delivery_note'],
  recipientOtp: json['recipient_otp'],
  collectedAmount: json['collected_amount'],
);

Map<String, dynamic> _$LifecycleToJson(Lifecycle instance) => <String, dynamic>{
  'current_stage': instance.currentStage,
  'arrived_pickup_at': instance.arrivedPickupAt,
  'pickup_confirmed_at': instance.pickupConfirmedAt,
  'arrived_dropoff_at': instance.arrivedDropoffAt,
  'delivered_at': instance.deliveredAt,
  'proof_photo_url': instance.proofPhotoUrl,
  'signature': instance.signature,
  'checklist': instance.checklist,
  'recipient_name': instance.recipientName,
  'delivery_note': instance.deliveryNote,
  'recipient_otp': instance.recipientOtp,
  'collected_amount': instance.collectedAmount,
};
