// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  orderNumberLabel: json['order_number_label'] as String?,
  orderNumber: json['order_number'] as String?,
  paymentBadgeLabel: json['payment_badge_label'] as String?,
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'order_number_label': instance.orderNumberLabel,
  'order_number': instance.orderNumber,
  'payment_badge_label': instance.paymentBadgeLabel,
};
