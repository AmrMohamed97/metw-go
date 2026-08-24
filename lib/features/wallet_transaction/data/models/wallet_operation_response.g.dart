// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_operation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletOperationsResponse _$WalletOperationsResponseFromJson(
  Map<String, dynamic> json,
) => WalletOperationsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : WalletOperationsDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WalletOperationsResponseToJson(
  WalletOperationsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

WalletOperationsDataModel _$WalletOperationsDataModelFromJson(
  Map<String, dynamic> json,
) => WalletOperationsDataModel(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => WalletOperationItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : WalletPaginationModel.fromJson(
          json['pagination'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WalletOperationsDataModelToJson(
  WalletOperationsDataModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'pagination': instance.pagination,
};

WalletOperationItemModel _$WalletOperationItemModelFromJson(
  Map<String, dynamic> json,
) => WalletOperationItemModel(
  id: json['id'] as String?,
  operationType: json['operation_type'] as String?,
  title: json['title'] as String?,
  reference: json['reference'] as String?,
  amount: json['amount'] as num?,
  signedAmount: json['signed_amount'] as num?,
  direction: json['direction'] as String?,
  status: json['status'] as String?,
  currency: json['currency'] as String?,
  currencyLabel: json['currency_label'] as String?,
  occurredAt: json['occurred_at'] as String?,
  dateLabel: json['date_label'] as String?,
  iconKey: json['icon_key'] as String?,
);

Map<String, dynamic> _$WalletOperationItemModelToJson(
  WalletOperationItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'operation_type': instance.operationType,
  'title': instance.title,
  'reference': instance.reference,
  'amount': instance.amount,
  'signed_amount': instance.signedAmount,
  'direction': instance.direction,
  'status': instance.status,
  'currency': instance.currency,
  'currency_label': instance.currencyLabel,
  'occurred_at': instance.occurredAt,
  'date_label': instance.dateLabel,
  'icon_key': instance.iconKey,
};

WalletPaginationModel _$WalletPaginationModelFromJson(
  Map<String, dynamic> json,
) => WalletPaginationModel(
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  hasMore: json['has_more'] as bool?,
);

Map<String, dynamic> _$WalletPaginationModelToJson(
  WalletPaginationModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'last_page': instance.lastPage,
  'has_more': instance.hasMore,
};
