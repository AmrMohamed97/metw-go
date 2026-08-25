import 'package:json_annotation/json_annotation.dart';

part 'reject_order_response.g.dart';

@JsonSerializable()
class RejectOrderResponse {
  final bool? success;
  final String? message;
  final RejectOrderDataModel? data;

  RejectOrderResponse({this.success, this.message, this.data});

  factory RejectOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RejectOrderResponseToJson(this);
}

@JsonSerializable()
class RejectOrderDataModel {
  @JsonKey(name: 'order_id')
  final int? orderId;
  final String? status;
  @JsonKey(name: 'order_status')
  final String? orderStatus;
  final String? reason;
  @JsonKey(name: 'custom_reason')
  final String? customReason;
  @JsonKey(name: 'removed_from_queue')
  final bool? removedFromQueue;

  RejectOrderDataModel({
    this.orderId,
    this.status,
    this.orderStatus,
    this.reason,
    this.customReason,
    this.removedFromQueue,
  });

  factory RejectOrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$RejectOrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RejectOrderDataModelToJson(this);
}
