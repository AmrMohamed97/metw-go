// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponse _$OrderDetailsResponseFromJson(
  Map<String, dynamic> json,
) => OrderDetailsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : OrderDetails.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailsResponseToJson(
  OrderDetailsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  priority: json['priority'] as String?,
  distanceKm: (json['distance_km'] as num?)?.toDouble(),
  pickupAddress: json['pickup_address'] as String?,
  dropoffAddress: json['dropoff_address'] as String?,
  estimatedFee: (json['estimated_fee'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
  canStart: json['can_start'] as bool?,
  courier: json['courier'] == null
      ? null
      : Courier.fromJson(json['courier'] as Map<String, dynamic>),
  sender: json['sender'] == null
      ? null
      : Sender.fromJson(json['sender'] as Map<String, dynamic>),
  receiver: json['receiver'] == null
      ? null
      : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
  parcels: (json['parcels'] as List<dynamic>?)
      ?.map((e) => Parcel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lifecycle: json['lifecycle'] == null
      ? null
      : Lifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>),
  ongoingOrder: json['ongoing_order'] == null
      ? null
      : OngoingOrderModel.fromJson(
          json['ongoing_order'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'priority': instance.priority,
      'distance_km': instance.distanceKm,
      'pickup_address': instance.pickupAddress,
      'dropoff_address': instance.dropoffAddress,
      'estimated_fee': instance.estimatedFee,
      'created_at': instance.createdAt,
      'can_start': instance.canStart,
      'courier': instance.courier,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'parcels': instance.parcels,
      'lifecycle': instance.lifecycle,
      'ongoing_order': instance.ongoingOrder,
    };
