// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    HistoryResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : HistoryResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryResponseToJson(HistoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

HistoryResponseData _$HistoryResponseDataFromJson(Map<String, dynamic> json) =>
    HistoryResponseData(
      history: json['history'] == null
          ? null
          : HistoryDataModel.fromJson(json['history'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : HistoryMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryResponseDataToJson(
  HistoryResponseData instance,
) => <String, dynamic>{'history': instance.history, 'meta': instance.meta};

HistoryDataModel _$HistoryDataModelFromJson(Map<String, dynamic> json) =>
    HistoryDataModel(
      title: json['title'] as String?,
      searchPlaceholder: json['search_placeholder'] as String?,
      search: json['search'] as String?,
      selectedFilter: json['selected_filter'] as String?,
      filters: (json['filters'] as List<dynamic>?)
          ?.map((e) => HistoryFilterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map(
            (e) => HistoryOrderItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$HistoryDataModelToJson(HistoryDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'search_placeholder': instance.searchPlaceholder,
      'search': instance.search,
      'selected_filter': instance.selectedFilter,
      'filters': instance.filters,
      'orders': instance.orders,
    };

HistoryFilterModel _$HistoryFilterModelFromJson(Map<String, dynamic> json) =>
    HistoryFilterModel(
      key: json['key'] as String?,
      label: json['label'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HistoryFilterModelToJson(HistoryFilterModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'count': instance.count,
    };

HistoryOrderItemModel _$HistoryOrderItemModelFromJson(
  Map<String, dynamic> json,
) => HistoryOrderItemModel(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  merchantName: json['merchant_name'] as String?,
  status: json['status'] as String?,
  statusKey: json['status_key'] as String?,
  statusLabel: json['status_label'] as String?,
  completedAt: json['completed_at'] as String?,
  completedAtLabel: json['completed_at_label'] as String?,
  fee: json['fee'] as num?,
  currency: json['currency'] as String?,
  canViewReceipt: json['can_view_receipt'] as bool?,
  viewReceiptLabel: json['view_receipt_label'] as String?,
  accentColor: json['accent_color'] as String?,
);

Map<String, dynamic> _$HistoryOrderItemModelToJson(
  HistoryOrderItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'merchant_name': instance.merchantName,
  'status': instance.status,
  'status_key': instance.statusKey,
  'status_label': instance.statusLabel,
  'completed_at': instance.completedAt,
  'completed_at_label': instance.completedAtLabel,
  'fee': instance.fee,
  'currency': instance.currency,
  'can_view_receipt': instance.canViewReceipt,
  'view_receipt_label': instance.viewReceiptLabel,
  'accent_color': instance.accentColor,
};

HistoryMetaModel _$HistoryMetaModelFromJson(Map<String, dynamic> json) =>
    HistoryMetaModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      hasMore: json['has_more'] as bool?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HistoryMetaModelToJson(HistoryMetaModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'has_more': instance.hasMore,
      'total': instance.total,
    };
