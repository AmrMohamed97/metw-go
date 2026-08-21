// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupConfirmation _$PickupConfirmationFromJson(Map<String, dynamic> json) =>
    PickupConfirmation(
      title: json['title'] as String?,
      headerCard: json['header_card'] == null
          ? null
          : HeaderCard.fromJson(json['header_card'] as Map<String, dynamic>),
      orderReference: json['order_reference'] as String?,
      merchantName: json['merchant_name'] as String?,
      subtitle: json['subtitle'] as String?,
      stepsTitle: json['steps_title'] as String?,
      checklistSteps: (json['checklist_steps'] as List<dynamic>?)
          ?.map((e) => ChecklistStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      signature: json['signature'] == null
          ? null
          : Signature.fromJson(json['signature'] as Map<String, dynamic>),
      proofPhoto: json['proof_photo'] == null
          ? null
          : ProofPhoto.fromJson(json['proof_photo'] as Map<String, dynamic>),
      pickupMap: json['pickup_map'] == null
          ? null
          : PickupMap.fromJson(json['pickup_map'] as Map<String, dynamic>),
      confirmButtonLabel: json['confirm_button_label'] as String?,
    );

Map<String, dynamic> _$PickupConfirmationToJson(PickupConfirmation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'header_card': instance.headerCard,
      'order_reference': instance.orderReference,
      'merchant_name': instance.merchantName,
      'subtitle': instance.subtitle,
      'steps_title': instance.stepsTitle,
      'checklist_steps': instance.checklistSteps,
      'signature': instance.signature,
      'proof_photo': instance.proofPhoto,
      'pickup_map': instance.pickupMap,
      'confirm_button_label': instance.confirmButtonLabel,
    };
