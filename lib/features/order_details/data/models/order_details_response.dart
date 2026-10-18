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
  final num? distanceKm;
  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;
  final num? fee;
  @JsonKey(name: 'estimated_fee')
  final num? estimatedFee;
  @JsonKey(name: 'accepted_fee')
  final num? acceptedFee;
  @JsonKey(name: 'fee_mode')
  final String? feeMode;
  @JsonKey(name: 'requires_fee_input')
  final bool? requiresFeeInput;
  final String? currency;
  final String? status;
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
  @JsonKey(name: 'order_details')
  final Map<String, dynamic>? orderDetails;
  @JsonKey(name: 'available_actions')
  final Map<String, dynamic>? availableActions;
  @JsonKey(name: 'pickup_confirmation')
  final Map<String, dynamic>? pickupConfirmation;
  @JsonKey(name: 'dropoff_confirmation')
  final Map<String, dynamic>? dropoffConfirmation;
  @JsonKey(name: 'delivered_success')
  final Map<String, dynamic>? deliveredSuccess;

  OrderDetails({
    this.id,
    this.orderNumber,
    this.priority,
    this.distanceKm,
    this.pickupAddress,
    this.dropoffAddress,
    this.fee,
    this.estimatedFee,
    this.acceptedFee,
    this.feeMode,
    this.requiresFeeInput,
    this.currency,
    this.status,
    this.createdAt,
    this.canStart,
    this.courier,
    this.sender,
    this.receiver,
    this.parcels,
    this.lifecycle,
    this.ongoingOrder,
    this.orderDetails,
    this.availableActions,
    this.pickupConfirmation,
    this.dropoffConfirmation,
    this.deliveredSuccess,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
