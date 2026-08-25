// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_order_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectOrderInputModel _$RejectOrderInputModelFromJson(
  Map<String, dynamic> json,
) => RejectOrderInputModel(
  reasonId: (json['reason_id'] as num?)?.toInt(),
  customReason: json['custom_reason'] as String?,
);

Map<String, dynamic> _$RejectOrderInputModelToJson(
  RejectOrderInputModel instance,
) => <String, dynamic>{
  'reason_id': instance.reasonId,
  'custom_reason': instance.customReason,
};
