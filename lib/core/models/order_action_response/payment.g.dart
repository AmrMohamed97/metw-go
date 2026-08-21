// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  title: json['title'] as String?,
  statusLabel: json['status_label'] as String?,
  requiredAmountLabel: json['required_amount_label'] as String?,
  requiredAmount: json['required_amount'] as num?,
  collectedAmountLabel: json['collected_amount_label'] as String?,
  collectedAmount: json['collected_amount'] as num?,
  remainingAmountLabel: json['remaining_amount_label'] as String?,
  remainingAmount: json['remaining_amount'] as num?,
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'title': instance.title,
  'status_label': instance.statusLabel,
  'required_amount_label': instance.requiredAmountLabel,
  'required_amount': instance.requiredAmount,
  'collected_amount_label': instance.collectedAmountLabel,
  'collected_amount': instance.collectedAmount,
  'remaining_amount_label': instance.remainingAmountLabel,
  'remaining_amount': instance.remainingAmount,
  'currency': instance.currency,
};
