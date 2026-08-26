// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomingOrder _$IncomingOrderFromJson(Map<String, dynamic> json) =>
    IncomingOrder(
      id: json['id'] as num?,
      orderNumber: json['order_number'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      distanceKm: json['distance_km'],
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      estimatedFee: json['estimated_fee'] as num?,
      createdAt: json['created_at'] as String?,
      canStart: json['can_start'] as bool?,
      lifecycle: json['lifecycle'] == null
          ? null
          : Lifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>),
      availableActions: json['available_actions'] == null
          ? null
          : AvailableActions.fromJson(
              json['available_actions'] as Map<String, dynamic>,
            ),
      ongoingOrder: json['ongoing_order'] == null
          ? null
          : OngoingOrder.fromJson(
              json['ongoing_order'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$IncomingOrderToJson(IncomingOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'priority': instance.priority,
      'distance_km': instance.distanceKm,
      'pickup_address': instance.pickupAddress,
      'dropoff_address': instance.dropoffAddress,
      'estimated_fee': instance.estimatedFee,
      'created_at': instance.createdAt,
      'can_start': instance.canStart,
      'lifecycle': instance.lifecycle,
      'available_actions': instance.availableActions,
      'ongoing_order': instance.ongoingOrder,
    };
