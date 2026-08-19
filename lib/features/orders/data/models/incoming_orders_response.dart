import 'package:json_annotation/json_annotation.dart';

import 'order_model.dart';

part 'incoming_orders_response.g.dart';

@JsonSerializable()
class IncomingOrdersResponse {
  bool? success;
  String? message;
  OrdersData? data;

  IncomingOrdersResponse({
    this.success,
    this.message,
    this.data,
  });

  factory IncomingOrdersResponse.fromJson(Map<String, dynamic> json) => _$IncomingOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IncomingOrdersResponseToJson(this);
}

@JsonSerializable()
class OrdersData {
  List<OrderModel>? data;
  Meta? meta;

  OrdersData({
    this.data,
    this.meta,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) => _$OrdersDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDataToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  int? total;

  Meta({
    this.currentPage,
    this.hasMore,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
