// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentLeg _$ShipmentLegFromJson(Map<String, dynamic> json) =>
    ShipmentLeg(code: json['code'] as String?, label: json['label'] as String?);

Map<String, dynamic> _$ShipmentLegToJson(ShipmentLeg instance) =>
    <String, dynamic>{'code': instance.code, 'label': instance.label};

ShipmentPath _$ShipmentPathFromJson(Map<String, dynamic> json) => ShipmentPath(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  typeLabel: json['type_label'] as String?,
  status: $enumDecodeNullable(_$ShipmentPathStatusEnumMap, json['status']),
  statusLabel: json['status_label'] as String?,
  legs: (json['legs'] as List<dynamic>?)
      ?.map((e) => ShipmentLeg.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentLeg: json['current_leg'] == null
      ? null
      : ShipmentLeg.fromJson(json['current_leg'] as Map<String, dynamic>),
  cost: json['cost'] as num?,
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$ShipmentPathToJson(ShipmentPath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'status': _$ShipmentPathStatusEnumMap[instance.status],
      'status_label': instance.statusLabel,
      'legs': instance.legs,
      'current_leg': instance.currentLeg,
      'cost': instance.cost,
      'currency': instance.currency,
    };

const _$ShipmentPathStatusEnumMap = {
  ShipmentPathStatus.matching: 'matching',
  ShipmentPathStatus.courierConfirmed: 'courier_confirmed',
  ShipmentPathStatus.submittedToClient: 'submitted_to_client',
  ShipmentPathStatus.clientSelected: 'client_selected',
  ShipmentPathStatus.executing: 'executing',
  ShipmentPathStatus.executed: 'executed',
  ShipmentPathStatus.failed: 'failed',
  ShipmentPathStatus.cancelled: 'cancelled',
};

ShipmentHandoff _$ShipmentHandoffFromJson(Map<String, dynamic> json) =>
    ShipmentHandoff(
      status: $enumDecodeNullable(_$HandoffStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ShipmentHandoffToJson(ShipmentHandoff instance) =>
    <String, dynamic>{'status': _$HandoffStatusEnumMap[instance.status]};

const _$HandoffStatusEnumMap = {
  HandoffStatus.locked: 'locked',
  HandoffStatus.awaitingReceiver: 'awaiting_receiver',
  HandoffStatus.awaitingSender: 'awaiting_sender',
  HandoffStatus.completed: 'completed',
  HandoffStatus.cancelled: 'cancelled',
};

ShipmentLifecycle _$ShipmentLifecycleFromJson(Map<String, dynamic> json) =>
    ShipmentLifecycle(
      currentHandoff: json['current_handoff'] == null
          ? null
          : ShipmentHandoff.fromJson(
              json['current_handoff'] as Map<String, dynamic>,
            ),
      canConfirmReceipt: json['can_confirm_receipt'] as bool?,
      canConfirmDelivery: json['can_confirm_delivery'] as bool?,
      canCompleteFinalDelivery: json['can_complete_final_delivery'] as bool?,
      canCancelAcceptance: json['can_cancel_acceptance'] as bool?,
    );

Map<String, dynamic> _$ShipmentLifecycleToJson(ShipmentLifecycle instance) =>
    <String, dynamic>{
      'current_handoff': instance.currentHandoff,
      'can_confirm_receipt': instance.canConfirmReceipt,
      'can_confirm_delivery': instance.canConfirmDelivery,
      'can_complete_final_delivery': instance.canCompleteFinalDelivery,
      'can_cancel_acceptance': instance.canCancelAcceptance,
    };

ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) =>
    ShipmentModel(
      id: (json['id'] as num?)?.toInt(),
      assignmentId: (json['assignment_id'] as num?)?.toInt(),
      shipmentRequestId: (json['shipment_request_id'] as num?)?.toInt(),
      requestNumber: json['request_number'] as String?,
      legType: json['leg_type'] as String?,
      partyType: json['party_type'] as String?,
      senderName: json['sender_name'] as String?,
      senderPhone: json['sender_phone'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverPhone: json['receiver_phone'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      packageCount: (json['package_count'] as num?)?.toInt(),
      totalParcels: (json['total_parcels'] as num?)?.toInt(),
      totalWeight: json['total_weight'] as num?,
      totalVolume: json['total_volume'] as num?,
      requestStatus: $enumDecodeNullable(
        _$ShipmentRequestStatusEnumMap,
        json['request_status'],
      ),
      requestStatusLabel: json['request_status_label'] as String?,
      path: json['path'] == null
          ? null
          : ShipmentPath.fromJson(json['path'] as Map<String, dynamic>),
      status: $enumDecodeNullable(
        _$ShipmentAssignmentStatusEnumMap,
        json['status'],
      ),
      feeMode: json['fee_mode'] as String?,
      feeSource: json['fee_source'] as String?,
      offeredFee: json['offered_fee'] as num?,
      acceptedFee: json['accepted_fee'] as num?,
      estimatedFee: json['estimated_fee'] as num?,
      lifecycle: json['lifecycle'] == null
          ? null
          : ShipmentLifecycle.fromJson(
              json['lifecycle'] as Map<String, dynamic>,
            ),
      fee: json['fee'] as num?,
      requiresFeeInput: json['requires_fee_input'] as bool?,
      currency: json['currency'] as String?,
      responseDeadline: json['response_deadline'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ShipmentModelToJson(ShipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assignment_id': instance.assignmentId,
      'shipment_request_id': instance.shipmentRequestId,
      'request_number': instance.requestNumber,
      'leg_type': instance.legType,
      'party_type': instance.partyType,
      'sender_name': instance.senderName,
      'sender_phone': instance.senderPhone,
      'receiver_name': instance.receiverName,
      'receiver_phone': instance.receiverPhone,
      'pickup_address': instance.pickupAddress,
      'dropoff_address': instance.dropoffAddress,
      'package_count': instance.packageCount,
      'total_parcels': instance.totalParcels,
      'total_weight': instance.totalWeight,
      'total_volume': instance.totalVolume,
      'request_status': _$ShipmentRequestStatusEnumMap[instance.requestStatus],
      'request_status_label': instance.requestStatusLabel,
      'path': instance.path,
      'status': _$ShipmentAssignmentStatusEnumMap[instance.status],
      'fee_mode': instance.feeMode,
      'fee_source': instance.feeSource,
      'offered_fee': instance.offeredFee,
      'accepted_fee': instance.acceptedFee,
      'estimated_fee': instance.estimatedFee,
      'lifecycle': instance.lifecycle,
      'fee': instance.fee,
      'requires_fee_input': instance.requiresFeeInput,
      'currency': instance.currency,
      'response_deadline': instance.responseDeadline,
      'created_at': instance.createdAt,
    };

const _$ShipmentRequestStatusEnumMap = {
  ShipmentRequestStatus.draft: 'draft',
  ShipmentRequestStatus.submitted: 'submitted',
  ShipmentRequestStatus.matching: 'matching',
  ShipmentRequestStatus.awaitingPathSelection: 'awaiting_path_selection',
  ShipmentRequestStatus.awaitingAdvance: 'awaiting_advance',
  ShipmentRequestStatus.executing: 'executing',
  ShipmentRequestStatus.completed: 'completed',
  ShipmentRequestStatus.cancelled: 'cancelled',
  ShipmentRequestStatus.rejected: 'rejected',
  ShipmentRequestStatus.failedUnavailable: 'failed_unavailable',
};

const _$ShipmentAssignmentStatusEnumMap = {
  ShipmentAssignmentStatus.pending: 'pending',
  ShipmentAssignmentStatus.accepted: 'accepted',
  ShipmentAssignmentStatus.confirmed: 'confirmed',
  ShipmentAssignmentStatus.reserve: 'reserve',
  ShipmentAssignmentStatus.executing: 'executing',
  ShipmentAssignmentStatus.completed: 'completed',
  ShipmentAssignmentStatus.rejected: 'rejected',
  ShipmentAssignmentStatus.expired: 'expired',
  ShipmentAssignmentStatus.cancelled: 'cancelled',
};
