// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponse _$OrderDetailsResponseFromJson(
  Map<String, dynamic> json,
) => OrderDetailsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : OrderModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailsResponseToJson(
  OrderDetailsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
