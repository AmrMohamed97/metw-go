// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  courier: json['courier'] == null
      ? null
      : Courier.fromJson(json['courier'] as Map<String, dynamic>),
  stats: json['stats'] == null
      ? null
      : Stats.fromJson(json['stats'] as Map<String, dynamic>),
  notifications: json['notifications'] == null
      ? null
      : Notifications.fromJson(json['notifications'] as Map<String, dynamic>),
  incomingOrders: (json['incoming_orders'] as List<dynamic>?)
      ?.map((e) => IncomingOrder.fromJson(e as Map<String, dynamic>))
      .toList(),
  activeOrder: json['active_order'] == null
      ? null
      : IncomingOrder.fromJson(json['active_order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'courier': instance.courier,
  'stats': instance.stats,
  'notifications': instance.notifications,
  'incoming_orders': instance.incomingOrders,
  'active_order': instance.activeOrder,
};
