// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartOrderResponse _$StartOrderResponseFromJson(Map<String, dynamic> json) =>
    StartOrderResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartOrderResponseToJson(StartOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
