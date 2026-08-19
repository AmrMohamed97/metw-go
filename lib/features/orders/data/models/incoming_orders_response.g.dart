// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomingOrdersResponse _$IncomingOrdersResponseFromJson(
  Map<String, dynamic> json,
) => IncomingOrdersResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : OrdersData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IncomingOrdersResponseToJson(
  IncomingOrdersResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

OrdersData _$OrdersDataFromJson(Map<String, dynamic> json) => OrdersData(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrdersDataToJson(OrdersData instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num?)?.toInt(),
  hasMore: json['has_more'] as bool?,
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'has_more': instance.hasMore,
  'total': instance.total,
};
