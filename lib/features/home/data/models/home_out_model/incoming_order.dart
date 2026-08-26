import 'package:json_annotation/json_annotation.dart';

import 'available_actions.dart';
import 'lifecycle.dart';
import 'ongoing_order.dart';

part 'incoming_order.g.dart';

@JsonSerializable()
class IncomingOrder {
  num? id;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  String? status;
  String? priority;
  @JsonKey(name: 'distance_km')
  dynamic distanceKm;
  @JsonKey(name: 'pickup_address')
  String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  String? dropoffAddress;
  @JsonKey(name: 'estimated_fee')
  num? estimatedFee;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'can_start')
  bool? canStart;
  Lifecycle? lifecycle;
  @JsonKey(name: 'available_actions')
  AvailableActions? availableActions;
  @JsonKey(name: 'ongoing_order')
  OngoingOrder? ongoingOrder;

  IncomingOrder({
    this.id,
    this.orderNumber,
    this.status,
    this.priority,
    this.distanceKm,
    this.pickupAddress,
    this.dropoffAddress,
    this.estimatedFee,
    this.createdAt,
    this.canStart,
    this.lifecycle,
    this.availableActions,
    this.ongoingOrder,
  });

  factory IncomingOrder.fromJson(Map<String, dynamic> json) {
    return _$IncomingOrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IncomingOrderToJson(this);
}
