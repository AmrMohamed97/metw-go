import 'package:json_annotation/json_annotation.dart';

import 'available_actions.dart';
import 'delivered_success.dart';
import 'dropoff_confirmation.dart';
import 'lifecycle.dart';
import 'ongoing_order.dart';
import 'order_details.dart';
import 'parcel.dart';
import 'pickup_confirmation.dart';
import 'receiver.dart';
import 'sender.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  num? id;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  String? priority;
  @JsonKey(name: 'distance_km')
  dynamic distanceKm;
  @JsonKey(name: 'pickup_address')
  String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  String? dropoffAddress;
  Sender? sender;
  Receiver? receiver;
  List<Parcel>? parcels;
  num? fee;
  String? status;
  Lifecycle? lifecycle;
  @JsonKey(name: 'available_actions')
  AvailableActions? availableActions;
  @JsonKey(name: 'order_details')
  OrderDetails? orderDetails;
  @JsonKey(name: 'ongoing_order')
  OngoingOrder? ongoingOrder;
  @JsonKey(name: 'pickup_confirmation')
  PickupConfirmation? pickupConfirmation;
  @JsonKey(name: 'dropoff_confirmation')
  DropoffConfirmation? dropoffConfirmation;
  @JsonKey(name: 'delivered_success')
  DeliveredSuccess? deliveredSuccess;

  Order({
    this.id,
    this.orderNumber,
    this.priority,
    this.distanceKm,
    this.pickupAddress,
    this.dropoffAddress,
    this.sender,
    this.receiver,
    this.parcels,
    this.fee,
    this.status,
    this.lifecycle,
    this.availableActions,
    this.orderDetails,
    this.ongoingOrder,
    this.pickupConfirmation,
    this.dropoffConfirmation,
    this.deliveredSuccess,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
