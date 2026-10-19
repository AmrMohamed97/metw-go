import 'package:json_annotation/json_annotation.dart';
import 'shipment_enums.dart';

part 'shipment_model.g.dart';

// ─── Leg ─────────────────────────────────────────────────────────────────────

@JsonSerializable()
class ShipmentLeg {
  final String? code;
  final String? label;

  ShipmentLeg({this.code, this.label});

  factory ShipmentLeg.fromJson(Map<String, dynamic> json) =>
      _$ShipmentLegFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentLegToJson(this);
}

// ─── Path ────────────────────────────────────────────────────────────────────

@JsonSerializable()
class ShipmentPath {
  final int? id;
  final String? type;
  @JsonKey(name: 'type_label')
  final String? typeLabel;
  final ShipmentPathStatus? status;
  @JsonKey(name: 'status_label')
  final String? statusLabel;
  final List<ShipmentLeg>? legs;
  @JsonKey(name: 'current_leg')
  final ShipmentLeg? currentLeg;
  final num? cost;
  final String? currency;

  ShipmentPath({
    this.id,
    this.type,
    this.typeLabel,
    this.status,
    this.statusLabel,
    this.legs,
    this.currentLeg,
    this.cost,
    this.currency,
  });

  factory ShipmentPath.fromJson(Map<String, dynamic> json) =>
      _$ShipmentPathFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentPathToJson(this);
}

// ─── Handoff ─────────────────────────────────────────────────────────────────

@JsonSerializable()
class ShipmentHandoff {
  final HandoffStatus? status;

  ShipmentHandoff({this.status});

  factory ShipmentHandoff.fromJson(Map<String, dynamic> json) =>
      _$ShipmentHandoffFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentHandoffToJson(this);
}

// ─── Lifecycle ───────────────────────────────────────────────────────────────

@JsonSerializable()
class ShipmentLifecycle {
  @JsonKey(name: 'current_handoff')
  final ShipmentHandoff? currentHandoff;
  @JsonKey(name: 'can_confirm_receipt')
  final bool? canConfirmReceipt;
  @JsonKey(name: 'can_confirm_delivery')
  final bool? canConfirmDelivery;
  @JsonKey(name: 'can_complete_final_delivery')
  final bool? canCompleteFinalDelivery;
  @JsonKey(name: 'can_cancel_acceptance')
  final bool? canCancelAcceptance;

  ShipmentLifecycle({
    this.currentHandoff,
    this.canConfirmReceipt,
    this.canConfirmDelivery,
    this.canCompleteFinalDelivery,
    this.canCancelAcceptance,
  });

  factory ShipmentLifecycle.fromJson(Map<String, dynamic> json) =>
      _$ShipmentLifecycleFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentLifecycleToJson(this);
}

// ─── Main Shipment Model ─────────────────────────────────────────────────────

@JsonSerializable()
class ShipmentModel {
  final int? id;
  @JsonKey(name: 'assignment_id')
  final int? assignmentId;
  @JsonKey(name: 'shipment_request_id')
  final int? shipmentRequestId;
  @JsonKey(name: 'request_number')
  final String? requestNumber;
  @JsonKey(name: 'leg_type')
  final String? legType;
  @JsonKey(name: 'party_type')
  final String? partyType;
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @JsonKey(name: 'sender_phone')
  final String? senderPhone;
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @JsonKey(name: 'receiver_phone')
  final String? receiverPhone;
  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;
  @JsonKey(name: 'package_count')
  final int? packageCount;
  @JsonKey(name: 'total_parcels')
  final int? totalParcels;
  @JsonKey(name: 'total_weight')
  final num? totalWeight;
  @JsonKey(name: 'total_volume')
  final num? totalVolume;
  @JsonKey(name: 'request_status')
  final ShipmentRequestStatus? requestStatus;
  @JsonKey(name: 'request_status_label')
  final String? requestStatusLabel;
  final ShipmentPath? path;
  final ShipmentAssignmentStatus? status;
  @JsonKey(name: 'fee_mode')
  final String? feeMode;
  @JsonKey(name: 'fee_source')
  final String? feeSource;
  @JsonKey(name: 'offered_fee')
  final num? offeredFee;
  @JsonKey(name: 'accepted_fee')
  final num? acceptedFee;
  @JsonKey(name: 'estimated_fee')
  final num? estimatedFee;
  final ShipmentLifecycle? lifecycle;
  final num? fee;
  @JsonKey(name: 'requires_fee_input')
  final bool? requiresFeeInput;
  final String? currency;
  @JsonKey(name: 'response_deadline')
  final String? responseDeadline;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  ShipmentModel({
    this.id,
    this.assignmentId,
    this.shipmentRequestId,
    this.requestNumber,
    this.legType,
    this.partyType,
    this.senderName,
    this.senderPhone,
    this.receiverName,
    this.receiverPhone,
    this.pickupAddress,
    this.dropoffAddress,
    this.packageCount,
    this.totalParcels,
    this.totalWeight,
    this.totalVolume,
    this.requestStatus,
    this.requestStatusLabel,
    this.path,
    this.status,
    this.feeMode,
    this.feeSource,
    this.offeredFee,
    this.acceptedFee,
    this.estimatedFee,
    this.lifecycle,
    this.fee,
    this.requiresFeeInput,
    this.currency,
    this.responseDeadline,
    this.createdAt,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentModelToJson(this);
}
