// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_shipments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomingShipmentsResponse _$IncomingShipmentsResponseFromJson(
  Map<String, dynamic> json,
) => IncomingShipmentsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ShipmentsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IncomingShipmentsResponseToJson(
  IncomingShipmentsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ShipmentsData _$ShipmentsDataFromJson(Map<String, dynamic> json) =>
    ShipmentsData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShipmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : ShipmentsMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentsDataToJson(ShipmentsData instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};

ShipmentsMeta _$ShipmentsMetaFromJson(Map<String, dynamic> json) =>
    ShipmentsMeta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      hasMore: json['has_more'] as bool?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipmentsMetaToJson(ShipmentsMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'has_more': instance.hasMore,
      'total': instance.total,
    };
