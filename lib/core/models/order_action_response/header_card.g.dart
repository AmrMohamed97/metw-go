// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderCard _$HeaderCardFromJson(Map<String, dynamic> json) => HeaderCard(
  orderReference: json['order_reference'] as String?,
  merchantName: json['merchant_name'] as String?,
  subtitle: json['subtitle'] as String?,
);

Map<String, dynamic> _$HeaderCardToJson(HeaderCard instance) =>
    <String, dynamic>{
      'order_reference': instance.orderReference,
      'merchant_name': instance.merchantName,
      'subtitle': instance.subtitle,
    };
