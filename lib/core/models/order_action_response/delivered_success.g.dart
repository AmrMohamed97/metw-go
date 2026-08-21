// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivered_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveredSuccess _$DeliveredSuccessFromJson(Map<String, dynamic> json) =>
    DeliveredSuccess(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      badge: json['badge'] as String?,
      earningsTitle: json['earnings_title'] as String?,
      earningsAmount: json['earnings_amount'] as num?,
      currency: json['currency'] as String?,
      orderReference: json['order_reference'] as String?,
      deliveredAt: json['delivered_at'] as String?,
      merchantName: json['merchant_name'] as String?,
      customerName: json['customer_name'] as String?,
      paymentMethodLabel: json['payment_method_label'] as String?,
      walletNote: json['wallet_note'] as String?,
      primaryActionLabel: json['primary_action_label'] as String?,
      secondaryActionLabel: json['secondary_action_label'] as String?,
    );

Map<String, dynamic> _$DeliveredSuccessToJson(DeliveredSuccess instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'badge': instance.badge,
      'earnings_title': instance.earningsTitle,
      'earnings_amount': instance.earningsAmount,
      'currency': instance.currency,
      'order_reference': instance.orderReference,
      'delivered_at': instance.deliveredAt,
      'merchant_name': instance.merchantName,
      'customer_name': instance.customerName,
      'payment_method_label': instance.paymentMethodLabel,
      'wallet_note': instance.walletNote,
      'primary_action_label': instance.primaryActionLabel,
      'secondary_action_label': instance.secondaryActionLabel,
    };
