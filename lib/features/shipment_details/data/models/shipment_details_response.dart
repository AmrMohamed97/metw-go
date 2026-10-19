import 'package:json_annotation/json_annotation.dart';
import 'package:metw_go/features/shipments/data/models/shipment_model.dart';

part 'shipment_details_response.g.dart';

@JsonSerializable()
class ShipmentParty {
  final String? name;
  final String? phone;
  final String? address;
  @JsonKey(name: 'governorate_id')
  final int? governorateId;
  @JsonKey(name: 'city_id')
  final int? cityId;

  ShipmentParty({
    this.name,
    this.phone,
    this.address,
    this.governorateId,
    this.cityId,
  });

  factory ShipmentParty.fromJson(Map<String, dynamic> json) =>
      _$ShipmentPartyFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentPartyToJson(this);
}

@JsonSerializable()
class ShipmentPackage {
  @JsonKey(name: 'package_number')
  final String? packageNumber;
  final String? name;
  final String? type;
  final num? weight;
  final int? quantity;
  final num? length;
  final num? width;
  final num? height;

  ShipmentPackage({
    this.packageNumber,
    this.name,
    this.type,
    this.weight,
    this.quantity,
    this.length,
    this.width,
    this.height,
  });

  factory ShipmentPackage.fromJson(Map<String, dynamic> json) =>
      _$ShipmentPackageFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentPackageToJson(this);
}

@JsonSerializable()
class ShipmentTrackingStep {
  final String? key;
  final String? label;
  @JsonKey(name: 'is_complete')
  final bool? isComplete;
  @JsonKey(name: 'is_current')
  final bool? isCurrent;

  ShipmentTrackingStep({
    this.key,
    this.label,
    this.isComplete,
    this.isCurrent,
  });

  factory ShipmentTrackingStep.fromJson(Map<String, dynamic> json) =>
      _$ShipmentTrackingStepFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentTrackingStepToJson(this);
}

@JsonSerializable()
class ShipmentDetailsData {
  final int? id;
  @JsonKey(name: 'assignment_id')
  final int? assignmentId;
  @JsonKey(name: 'shipment_request_id')
  final int? shipmentRequestId;
  @JsonKey(name: 'request_path_id')
  final int? requestPathId;
  @JsonKey(name: 'leg_type')
  final String? legType;
  @JsonKey(name: 'party_type')
  final String? partyType;
  @JsonKey(name: 'request_number')
  final String? requestNumber;
  final ShipmentParty? sender;
  final ShipmentParty? receiver;
  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;
  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;
  final List<ShipmentPackage>? packages;
  @JsonKey(name: 'total_parcels')
  final int? totalParcels;
  @JsonKey(name: 'total_weight')
  final num? totalWeight;
  @JsonKey(name: 'total_volume')
  final num? totalVolume;
  @JsonKey(name: 'request_status')
  final String? requestStatus;
  @JsonKey(name: 'request_status_label')
  final String? requestStatusLabel;
  final List<ShipmentTrackingStep>? tracking;
  final ShipmentPath? path;
  final ShipmentLifecycle? lifecycle;
  final String? notes;
  final String? status;
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
  final num? fee;
  @JsonKey(name: 'requires_fee_input')
  final bool? requiresFeeInput;
  final String? currency;
  @JsonKey(name: 'response_deadline')
  final String? responseDeadline;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  ShipmentDetailsData({
    this.id,
    this.assignmentId,
    this.shipmentRequestId,
    this.requestPathId,
    this.legType,
    this.partyType,
    this.requestNumber,
    this.sender,
    this.receiver,
    this.pickupAddress,
    this.dropoffAddress,
    this.packages,
    this.totalParcels,
    this.totalWeight,
    this.totalVolume,
    this.requestStatus,
    this.requestStatusLabel,
    this.tracking,
    this.path,
    this.lifecycle,
    this.notes,
    this.status,
    this.feeMode,
    this.feeSource,
    this.offeredFee,
    this.acceptedFee,
    this.estimatedFee,
    this.fee,
    this.requiresFeeInput,
    this.currency,
    this.responseDeadline,
    this.createdAt,
  });

  factory ShipmentDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentDetailsDataToJson(this);
}

@JsonSerializable()
class ShipmentDetailsResponse {
  final bool? success;
  final String? message;
  final ShipmentDetailsData? data;

  ShipmentDetailsResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ShipmentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentDetailsResponseToJson(this);
}
