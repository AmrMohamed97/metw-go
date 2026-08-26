import 'package:json_annotation/json_annotation.dart';
import 'courier.dart';
import 'sender.dart';
import 'receiver.dart';
import 'parcel.dart';
import 'lifecycle.dart';
import 'ongoing_order_model.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  final bool? success;
  final String? message;
  final OrderDetails? data;

  OrderDetailsResponse({this.success, this.message, this.data});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    final generated = _$OrderDetailsResponseFromJson(json);
    OrderDetails? orderData = generated.data;
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      final dataMap = json['data'] as Map<String, dynamic>;
      if (dataMap['active_order'] != null &&
          dataMap['active_order'] is Map<String, dynamic>) {
        orderData = OrderDetails.fromJson(
          dataMap['active_order'] as Map<String, dynamic>,
        );
      }
    }
    return OrderDetailsResponse(
      success: generated.success,
      message: generated.message,
      data: orderData,
    );
  }

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
  @JsonKey(name: 'ongoing_order')
  final OngoingOrderModel? ongoingOrder;

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
    this.ongoingOrder,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
