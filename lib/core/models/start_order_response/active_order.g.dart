// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveOrder _$ActiveOrderFromJson(Map<String, dynamic> json) => ActiveOrder(
  id: json['id'] as num?,
  orderNumber: json['order_number'] as String?,
  status: json['status'] as String?,
  label: json['label'] as String?,
);

Map<String, dynamic> _$ActiveOrderToJson(ActiveOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'label': instance.label,
    };
