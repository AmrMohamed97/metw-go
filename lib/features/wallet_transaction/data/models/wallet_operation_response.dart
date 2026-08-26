import 'package:json_annotation/json_annotation.dart';

part 'wallet_operation_response.g.dart';

@JsonSerializable()
class WalletOperationsResponse {
  final bool? success;
  final String? message;
  final WalletOperationsDataModel? data;

  WalletOperationsResponse({this.success, this.message, this.data});

  factory WalletOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletOperationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOperationsResponseToJson(this);
}

@JsonSerializable()
class WalletOperationsDataModel {
  final List<WalletOperationItemModel>? items;
  final WalletPaginationModel? pagination;

  WalletOperationsDataModel({this.items, this.pagination});

  factory WalletOperationsDataModel.fromJson(Map<String, dynamic> json) =>
      _$WalletOperationsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOperationsDataModelToJson(this);
}

@JsonSerializable()
class WalletOperationItemModel {
  final String? id;
  @JsonKey(name: 'operation_type')
  final String? operationType;
  final String? title;
  final String? reference;
  final num? amount;
  @JsonKey(name: 'signed_amount')
  final num? signedAmount;
  final String? direction;
  final String? status;
  final String? currency;
  @JsonKey(name: 'currency_label')
  final String? currencyLabel;
  @JsonKey(name: 'occurred_at')
  final String? occurredAt;
  @JsonKey(name: 'date_label')
  final String? dateLabel;
  @JsonKey(name: 'icon_key')
  final String? iconKey;

  WalletOperationItemModel({
    this.id,
    this.operationType,
    this.title,
    this.reference,
    this.amount,
    this.signedAmount,
    this.direction,
    this.status,
    this.currency,
    this.currencyLabel,
    this.occurredAt,
    this.dateLabel,
    this.iconKey,
  });

  factory WalletOperationItemModel.fromJson(Map<String, dynamic> json) =>
      _$WalletOperationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOperationItemModelToJson(this);
}

@JsonSerializable()
class WalletPaginationModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  WalletPaginationModel({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
    this.hasMore,
  });

  factory WalletPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$WalletPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletPaginationModelToJson(this);
}
