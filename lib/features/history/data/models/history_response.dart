import 'package:json_annotation/json_annotation.dart';

part 'history_response.g.dart';

@JsonSerializable()
class HistoryResponse {
  final bool? success;
  final String? message;
  final HistoryResponseData? data;

  HistoryResponse({this.success, this.message, this.data});

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);
}

@JsonSerializable()
class HistoryResponseData {
  final HistoryDataModel? history;
  final HistoryMetaModel? meta;

  HistoryResponseData({this.history, this.meta});

  factory HistoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseDataToJson(this);
}

@JsonSerializable()
class HistoryDataModel {
  final String? title;
  @JsonKey(name: 'search_placeholder')
  final String? searchPlaceholder;
  final String? search;
  @JsonKey(name: 'selected_filter')
  final String? selectedFilter;
  final List<HistoryFilterModel>? filters;
  final List<HistoryOrderItemModel>? orders;

  HistoryDataModel({
    this.title,
    this.searchPlaceholder,
    this.search,
    this.selectedFilter,
    this.filters,
    this.orders,
  });

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDataModelToJson(this);
}

@JsonSerializable()
class HistoryFilterModel {
  final String? key;
  final String? label;
  final int? count;

  HistoryFilterModel({this.key, this.label, this.count});

  factory HistoryFilterModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryFilterModelToJson(this);
}

@JsonSerializable()
class HistoryOrderItemModel {
  final int? id;
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  @JsonKey(name: 'merchant_name')
  final String? merchantName;
  final String? status;
  @JsonKey(name: 'status_key')
  final String? statusKey;
  @JsonKey(name: 'status_label')
  final String? statusLabel;
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @JsonKey(name: 'completed_at_label')
  final String? completedAtLabel;
  final num? fee;
  final String? currency;
  @JsonKey(name: 'can_view_receipt')
  final bool? canViewReceipt;
  @JsonKey(name: 'view_receipt_label')
  final String? viewReceiptLabel;
  @JsonKey(name: 'accent_color')
  final String? accentColor;

  HistoryOrderItemModel({
    this.id,
    this.orderNumber,
    this.merchantName,
    this.status,
    this.statusKey,
    this.statusLabel,
    this.completedAt,
    this.completedAtLabel,
    this.fee,
    this.currency,
    this.canViewReceipt,
    this.viewReceiptLabel,
    this.accentColor,
  });

  factory HistoryOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderItemModelToJson(this);
}

@JsonSerializable()
class HistoryMetaModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'has_more')
  final bool? hasMore;
  final int? total;

  HistoryMetaModel({
    this.currentPage,
    this.hasMore,
    this.total,
  });

  factory HistoryMetaModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryMetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryMetaModelToJson(this);
}
