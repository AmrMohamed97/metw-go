// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyResponse _$EmptyResponseFromJson(Map<String, dynamic> json) =>
    EmptyResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EmptyResponseToJson(EmptyResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
