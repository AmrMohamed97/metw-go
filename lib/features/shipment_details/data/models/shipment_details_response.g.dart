// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentParty _$ShipmentPartyFromJson(Map<String, dynamic> json) =>
    ShipmentParty(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      governorateId: (json['governorate_id'] as num?)?.toInt(),
      cityId: (json['city_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipmentPartyToJson(ShipmentParty instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'governorate_id': instance.governorateId,
      'city_id': instance.cityId,
    };

ShipmentPackage _$ShipmentPackageFromJson(Map<String, dynamic> json) =>
    ShipmentPackage(
      packageNumber: json['package_number'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      weight: json['weight'] as num?,
      quantity: (json['quantity'] as num?)?.toInt(),
      length: json['length'] as num?,
      width: json['width'] as num?,
      height: json['height'] as num?,
    );

Map<String, dynamic> _$ShipmentPackageToJson(ShipmentPackage instance) =>
    <String, dynamic>{
      'package_number': instance.packageNumber,
      'name': instance.name,
      'type': instance.type,
      'weight': instance.weight,
      'quantity': instance.quantity,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };

ShipmentTrackingStep _$ShipmentTrackingStepFromJson(
  Map<String, dynamic> json,
) => ShipmentTrackingStep(
  key: json['key'] as String?,
  label: json['label'] as String?,
  isComplete: json['is_complete'] as bool?,
  isCurrent: json['is_current'] as bool?,
);

Map<String, dynamic> _$ShipmentTrackingStepToJson(
  ShipmentTrackingStep instance,
) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'is_complete': instance.isComplete,
  'is_current': instance.isCurrent,
};

ShipmentDetailsData _$ShipmentDetailsDataFromJson(Map<String, dynamic> json) =>
    ShipmentDetailsData(
      id: (json['id'] as num?)?.toInt(),
      assignmentId: (json['assignment_id'] as num?)?.toInt(),
      shipmentRequestId: (json['shipment_request_id'] as num?)?.toInt(),
      requestPathId: (json['request_path_id'] as num?)?.toInt(),
      legType: json['leg_type'] as String?,
      partyType: json['party_type'] as String?,
      requestNumber: json['request_number'] as String?,
      sender: json['sender'] == null
          ? null
          : ShipmentParty.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : ShipmentParty.fromJson(json['receiver'] as Map<String, dynamic>),
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => ShipmentPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalParcels: (json['total_parcels'] as num?)?.toInt(),
      totalWeight: json['total_weight'] as num?,
      totalVolume: json['total_volume'] as num?,
      requestStatus: json['request_status'] as String?,
      requestStatusLabel: json['request_status_label'] as String?,
      tracking: (json['tracking'] as List<dynamic>?)
          ?.map((e) => ShipmentTrackingStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] == null
          ? null
          : ShipmentPath.fromJson(json['path'] as Map<String, dynamic>),
      lifecycle: json['lifecycle'] == null
          ? null
          : ShipmentLifecycle.fromJson(
              json['lifecycle'] as Map<String, dynamic>,
            ),
      notes: json['notes'] as String?,
      status: json['status'] as String?,
      feeMode: json['fee_mode'] as String?,
      feeSource: json['fee_source'] as String?,
      offeredFee: json['offered_fee'] as num?,
      acceptedFee: json['accepted_fee'] as num?,
      estimatedFee: json['estimated_fee'] as num?,
      fee: json['fee'] as num?,
      requiresFeeInput: json['requires_fee_input'] as bool?,
      currency: json['currency'] as String?,
      responseDeadline: json['response_deadline'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ShipmentDetailsDataToJson(
  ShipmentDetailsData instance,
) => <String, dynamic>{
  'id': instance.id,
  'assignment_id': instance.assignmentId,
  'shipment_request_id': instance.shipmentRequestId,
  'request_path_id': instance.requestPathId,
  'leg_type': instance.legType,
  'party_type': instance.partyType,
  'request_number': instance.requestNumber,
  'sender': instance.sender,
  'receiver': instance.receiver,
  'pickup_address': instance.pickupAddress,
  'dropoff_address': instance.dropoffAddress,
  'packages': instance.packages,
  'total_parcels': instance.totalParcels,
  'total_weight': instance.totalWeight,
  'total_volume': instance.totalVolume,
  'request_status': instance.requestStatus,
  'request_status_label': instance.requestStatusLabel,
  'tracking': instance.tracking,
  'path': instance.path,
  'lifecycle': instance.lifecycle,
  'notes': instance.notes,
  'status': instance.status,
  'fee_mode': instance.feeMode,
  'fee_source': instance.feeSource,
  'offered_fee': instance.offeredFee,
  'accepted_fee': instance.acceptedFee,
  'estimated_fee': instance.estimatedFee,
  'fee': instance.fee,
  'requires_fee_input': instance.requiresFeeInput,
  'currency': instance.currency,
  'response_deadline': instance.responseDeadline,
  'created_at': instance.createdAt,
};

ShipmentDetailsResponse _$ShipmentDetailsResponseFromJson(
  Map<String, dynamic> json,
) => ShipmentDetailsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ShipmentDetailsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipmentDetailsResponseToJson(
  ShipmentDetailsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
