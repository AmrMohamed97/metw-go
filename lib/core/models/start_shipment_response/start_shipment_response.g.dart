// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_shipment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartShipmentResponse _$StartShipmentResponseFromJson(
  Map<String, dynamic> json,
) => StartShipmentResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StartShipmentResponseToJson(
  StartShipmentResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
