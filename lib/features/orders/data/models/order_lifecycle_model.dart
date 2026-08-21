import 'package:json_annotation/json_annotation.dart';

part 'order_lifecycle_model.g.dart';

@JsonSerializable()
class OrderLifecycleModel {
  @JsonKey(name: 'current_stage')
  String? currentStage;
  @JsonKey(name: 'arrived_pickup_at')
  String? arrivedPickupAt;
  @JsonKey(name: 'pickup_confirmed_at')
  String? pickupConfirmedAt;
  @JsonKey(name: 'arrived_dropoff_at')
  String? arrivedDropoffAt;
  @JsonKey(name: 'delivered_at')
  String? deliveredAt;
  @JsonKey(name: 'proof_photo_url')
  String? proofPhotoUrl;
  @JsonKey(name: 'signature')
  String? signature;
  @JsonKey(name: 'checklist')
  dynamic checklist;
  @JsonKey(name: 'recipient_name')
  String? recipientName;
  @JsonKey(name: 'delivery_note')
  String? deliveryNote;
  @JsonKey(name: 'recipient_otp')
  String? recipientOtp;
  @JsonKey(name: 'collected_amount')
  dynamic collectedAmount;

  OrderLifecycleModel({
    this.currentStage,
    this.arrivedPickupAt,
    this.pickupConfirmedAt,
    this.arrivedDropoffAt,
    this.deliveredAt,
    this.proofPhotoUrl,
    this.signature,
    this.checklist,
    this.recipientName,
    this.deliveryNote,
    this.recipientOtp,
    this.collectedAmount,
  });

  factory OrderLifecycleModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLifecycleModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLifecycleModelToJson(this);
}
