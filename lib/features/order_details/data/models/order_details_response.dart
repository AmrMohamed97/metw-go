import 'package:json_annotation/json_annotation.dart';
import 'courier.dart';
import 'sender.dart';
import 'receiver.dart';
import 'parcel.dart';
import 'lifecycle.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  final bool? success;
  final String? message;
  final OrderDetails? data;

  OrderDetailsResponse({this.success, this.message, this.data});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}

@JsonSerializable()
class OrderDetails {
  final int? id;
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  final String? priority;
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;
  @JsonKey(name: 'estimated_fee')
  final double? estimatedFee;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'can_start')
  final bool? canStart;
  final Courier? courier;
  final Sender? sender;
  final Receiver? receiver;
  final List<Parcel>? parcels;
  final Lifecycle? lifecycle;

  OrderDetails({
    this.id,
    this.orderNumber,
    this.priority,
    this.distanceKm,
    this.pickupAddress,
    this.dropoffAddress,
    this.estimatedFee,
    this.createdAt,
    this.canStart,
    this.courier,
    this.sender,
    this.receiver,
    this.parcels,
    this.lifecycle,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
