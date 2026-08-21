// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Earnings _$EarningsFromJson(Map<String, dynamic> json) => Earnings(
  title: json['title'] as String?,
  currency: json['currency'] as String?,
  netEarningsLabel: json['net_earnings_label'] as String?,
  netEarnings: json['net_earnings'] as num?,
  orderAmountLabel: json['order_amount_label'] as String?,
  orderAmount: json['order_amount'] as num?,
  deliveryFeeLabel: json['delivery_fee_label'] as String?,
  deliveryFee: json['delivery_fee'] as num?,
  commissionLabel: json['commission_label'] as String?,
  commissionAmount: json['commission_amount'] as num?,
);

Map<String, dynamic> _$EarningsToJson(Earnings instance) => <String, dynamic>{
  'title': instance.title,
  'currency': instance.currency,
  'net_earnings_label': instance.netEarningsLabel,
  'net_earnings': instance.netEarnings,
  'order_amount_label': instance.orderAmountLabel,
  'order_amount': instance.orderAmount,
  'delivery_fee_label': instance.deliveryFeeLabel,
  'delivery_fee': instance.deliveryFee,
  'commission_label': instance.commissionLabel,
  'commission_amount': instance.commissionAmount,
};
