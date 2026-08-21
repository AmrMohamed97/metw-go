// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderActionResponse _$OrderActionResponseFromJson(Map<String, dynamic> json) =>
    OrderActionResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderActionResponseToJson(
  OrderActionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
