// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lifecycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLifecycleModel _$OrderLifecycleModelFromJson(Map<String, dynamic> json) =>
    OrderLifecycleModel(
      currentStage: json['current_stage'] as String?,
      arrivedPickupAt: json['arrived_pickup_at'] as String?,
      pickupConfirmedAt: json['pickup_confirmed_at'] as String?,
      arrivedDropoffAt: json['arrived_dropoff_at'] as String?,
      deliveredAt: json['delivered_at'] as String?,
      proofPhotoUrl: json['proof_photo_url'] as String?,
      signature: json['signature'] as String?,
      checklist: json['checklist'],
      recipientName: json['recipient_name'] as String?,
      deliveryNote: json['delivery_note'] as String?,
      recipientOtp: json['recipient_otp'] as String?,
      collectedAmount: json['collected_amount'],
    );

Map<String, dynamic> _$OrderLifecycleModelToJson(
  OrderLifecycleModel instance,
) => <String, dynamic>{
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
