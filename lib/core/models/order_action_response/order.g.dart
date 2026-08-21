// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as num?,
  orderNumber: json['order_number'] as String?,
  priority: json['priority'] as String?,
  distanceKm: json['distance_km'],
  pickupAddress: json['pickup_address'] as String?,
  dropoffAddress: json['dropoff_address'] as String?,
  sender: json['sender'] == null
      ? null
      : Sender.fromJson(json['sender'] as Map<String, dynamic>),
  receiver: json['receiver'] == null
      ? null
      : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
  parcels: (json['parcels'] as List<dynamic>?)
      ?.map((e) => Parcel.fromJson(e as Map<String, dynamic>))
      .toList(),
  fee: json['fee'] as num?,
  status: json['status'] as String?,
  lifecycle: json['lifecycle'] == null
      ? null
      : Lifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>),
  availableActions: json['available_actions'] == null
      ? null
      : AvailableActions.fromJson(
          json['available_actions'] as Map<String, dynamic>,
        ),
  orderDetails: json['order_details'] == null
      ? null
      : OrderDetails.fromJson(json['order_details'] as Map<String, dynamic>),
  ongoingOrder: json['ongoing_order'] == null
      ? null
      : OngoingOrder.fromJson(json['ongoing_order'] as Map<String, dynamic>),
  pickupConfirmation: json['pickup_confirmation'] == null
      ? null
      : PickupConfirmation.fromJson(
          json['pickup_confirmation'] as Map<String, dynamic>,
        ),
  dropoffConfirmation: json['dropoff_confirmation'] == null
      ? null
      : DropoffConfirmation.fromJson(
          json['dropoff_confirmation'] as Map<String, dynamic>,
        ),
  deliveredSuccess: json['delivered_success'] == null
      ? null
      : DeliveredSuccess.fromJson(
          json['delivered_success'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'priority': instance.priority,
  'distance_km': instance.distanceKm,
  'pickup_address': instance.pickupAddress,
  'dropoff_address': instance.dropoffAddress,
  'sender': instance.sender,
  'receiver': instance.receiver,
  'parcels': instance.parcels,
  'fee': instance.fee,
  'status': instance.status,
  'lifecycle': instance.lifecycle,
  'available_actions': instance.availableActions,
  'order_details': instance.orderDetails,
  'ongoing_order': instance.ongoingOrder,
  'pickup_confirmation': instance.pickupConfirmation,
  'dropoff_confirmation': instance.dropoffConfirmation,
  'delivered_success': instance.deliveredSuccess,
};
