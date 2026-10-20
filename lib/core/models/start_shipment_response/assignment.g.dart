// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assignment _$AssignmentFromJson(Map<String, dynamic> json) => Assignment(
  id: json['id'] as num?,
  requestPathId: json['request_path_id'] as num?,
  legType: json['leg_type'] as String?,
  legLabel: json['leg_label'] as String?,
  representativeId: json['representative_id'] as num?,
  warehouseId: json['warehouse_id'],
  partyType: json['party_type'] as String?,
  representativeName: json['representative_name'] as String?,
  warehouseName: json['warehouse_name'],
  status: json['status'] as String?,
  statusLabel: json['status_label'] as String?,
  feeMode: json['fee_mode'] as String?,
  feeSource: json['fee_source'] as String?,
  offeredFee: json['offered_fee'],
  acceptedFee: json['accepted_fee'] as num?,
  requiresFeeInput: json['requires_fee_input'] as bool?,
  currency: json['currency'] as String?,
  offeredAt: json['offered_at'] == null
      ? null
      : DateTime.parse(json['offered_at'] as String),
  respondedAt: json['responded_at'] == null
      ? null
      : DateTime.parse(json['responded_at'] as String),
  responseDeadlineAt: json['response_deadline_at'] == null
      ? null
      : DateTime.parse(json['response_deadline_at'] as String),
  windowOpensAt: json['window_opens_at'] == null
      ? null
      : DateTime.parse(json['window_opens_at'] as String),
  windowClosesAt: json['window_closes_at'] == null
      ? null
      : DateTime.parse(json['window_closes_at'] as String),
  rejectionNote: json['rejection_note'],
);

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_path_id': instance.requestPathId,
      'leg_type': instance.legType,
      'leg_label': instance.legLabel,
      'representative_id': instance.representativeId,
      'warehouse_id': instance.warehouseId,
      'party_type': instance.partyType,
      'representative_name': instance.representativeName,
      'warehouse_name': instance.warehouseName,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'fee_mode': instance.feeMode,
      'fee_source': instance.feeSource,
      'offered_fee': instance.offeredFee,
      'accepted_fee': instance.acceptedFee,
      'requires_fee_input': instance.requiresFeeInput,
      'currency': instance.currency,
      'offered_at': instance.offeredAt?.toIso8601String(),
      'responded_at': instance.respondedAt?.toIso8601String(),
      'response_deadline_at': instance.responseDeadlineAt?.toIso8601String(),
      'window_opens_at': instance.windowOpensAt?.toIso8601String(),
      'window_closes_at': instance.windowClosesAt?.toIso8601String(),
      'rejection_note': instance.rejectionNote,
    };
