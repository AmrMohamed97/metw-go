// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropoff_confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropoffConfirmation _$DropoffConfirmationFromJson(Map<String, dynamic> json) =>
    DropoffConfirmation(
      title: json['title'] as String?,
      addressCard: json['address_card'] == null
          ? null
          : AddressCard.fromJson(json['address_card'] as Map<String, dynamic>),
      addressTitle: json['address_title'] as String?,
      receiverName: json['receiver_name'] as String?,
      address: json['address'] as String?,
      signature: json['signature'] == null
          ? null
          : Signature.fromJson(json['signature'] as Map<String, dynamic>),
      proofPhoto: json['proof_photo'] == null
          ? null
          : ProofPhoto.fromJson(json['proof_photo'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      map: json['map'] == null
          ? null
          : DropoffMap.fromJson(json['map'] as Map<String, dynamic>),
      confirmButtonLabel: json['confirm_button_label'] as String?,
    );

Map<String, dynamic> _$DropoffConfirmationToJson(
  DropoffConfirmation instance,
) => <String, dynamic>{
  'title': instance.title,
  'address_card': instance.addressCard,
  'address_title': instance.addressTitle,
  'receiver_name': instance.receiverName,
  'address': instance.address,
  'signature': instance.signature,
  'proof_photo': instance.proofPhoto,
  'payment': instance.payment,
  'verification': instance.verification,
  'map': instance.map,
  'confirm_button_label': instance.confirmButtonLabel,
};
