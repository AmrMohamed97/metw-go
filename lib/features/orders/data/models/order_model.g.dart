// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
  priority: json['priority'] as String?,
  distanceKm: (json['distance_km'] as num?)?.toDouble(),
  pickupAddress: json['pickup_address'] as String?,
  dropoffAddress: json['dropoff_address'] as String?,
  estimatedFee: json['estimated_fee'] as num?,
  createdAt: json['created_at'] as String?,
  canStart: json['can_start'] as bool?,
  lifecycle: json['lifecycle'] == null
      ? null
      : OrderLifecycleModel.fromJson(json['lifecycle'] as Map<String, dynamic>),
  availableActions: json['available_actions'] == null
      ? null
      : AvailableActionsModel.fromJson(
          json['available_actions'] as Map<String, dynamic>,
        ),
  ongoingOrder: json['ongoing_order'] == null
      ? null
      : OngoingOrderModel.fromJson(
          json['ongoing_order'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': _$OrderStatusEnumMap[instance.status],
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

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.pickup: 'pickup',
  OrderStatus.onWay: 'on_way',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.rejected: 'rejected',
  OrderStatus.returned: 'returned',
};
