import 'package:json_annotation/json_annotation.dart';

part 'lifecycle.g.dart';

@JsonSerializable()
class Lifecycle {
  @JsonKey(name: 'current_stage')
  String? currentStage;
  @JsonKey(name: 'arrived_pickup_at')
  dynamic arrivedPickupAt;
  @JsonKey(name: 'pickup_confirmed_at')
  dynamic pickupConfirmedAt;
  @JsonKey(name: 'arrived_dropoff_at')
  dynamic arrivedDropoffAt;
  @JsonKey(name: 'delivered_at')
  dynamic deliveredAt;
  @JsonKey(name: 'proof_photo_url')
  dynamic proofPhotoUrl;
  dynamic signature;
  dynamic checklist;
  @JsonKey(name: 'recipient_name')
  dynamic recipientName;
  @JsonKey(name: 'delivery_note')
  dynamic deliveryNote;
  @JsonKey(name: 'recipient_otp')
  dynamic recipientOtp;
  @JsonKey(name: 'collected_amount')
  dynamic collectedAmount;

  Lifecycle({
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

  factory Lifecycle.fromJson(Map<String, dynamic> json) {
    return _$LifecycleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LifecycleToJson(this);
}
