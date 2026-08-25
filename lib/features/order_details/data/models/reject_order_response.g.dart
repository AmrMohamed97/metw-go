// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectOrderResponse _$RejectOrderResponseFromJson(Map<String, dynamic> json) =>
    RejectOrderResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RejectOrderDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectOrderResponseToJson(
  RejectOrderResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

RejectOrderDataModel _$RejectOrderDataModelFromJson(
  Map<String, dynamic> json,
) => RejectOrderDataModel(
  orderId: (json['order_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  orderStatus: json['order_status'] as String?,
  reason: json['reason'] as String?,
  customReason: json['custom_reason'] as String?,
  removedFromQueue: json['removed_from_queue'] as bool?,
);

Map<String, dynamic> _$RejectOrderDataModelToJson(
  RejectOrderDataModel instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'status': instance.status,
  'order_status': instance.orderStatus,
  'reason': instance.reason,
  'custom_reason': instance.customReason,
  'removed_from_queue': instance.removedFromQueue,
};
