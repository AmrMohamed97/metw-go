import 'package:json_annotation/json_annotation.dart';

import 'available_actions_model.dart';
import 'ongoing_order_model.dart';
import 'order_lifecycle_model.dart';
import 'order_status.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  int? id;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  OrderStatus? status;
  String? priority;
  @JsonKey(name: 'distance_km')
  double? distanceKm;
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
  OrderLifecycleModel? lifecycle;
  @JsonKey(name: 'available_actions')
  AvailableActionsModel? availableActions;
  @JsonKey(name: 'ongoing_order')
  OngoingOrderModel? ongoingOrder;

  OrderModel({
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

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
