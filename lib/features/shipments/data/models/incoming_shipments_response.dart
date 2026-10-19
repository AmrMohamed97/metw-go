import 'package:json_annotation/json_annotation.dart';
import 'shipment_model.dart';

part 'incoming_shipments_response.g.dart';

@JsonSerializable()
class IncomingShipmentsResponse {
  final bool? success;
  final String? message;
  final ShipmentsData? data;

  IncomingShipmentsResponse({this.success, this.message, this.data});

  factory IncomingShipmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$IncomingShipmentsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IncomingShipmentsResponseToJson(this);
}

@JsonSerializable()
class ShipmentsData {
  final List<ShipmentModel>? data;
  final ShipmentsMeta? meta;

  ShipmentsData({this.data, this.meta});

  factory ShipmentsData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentsDataToJson(this);
}

@JsonSerializable()
class ShipmentsMeta {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'has_more')
  final bool? hasMore;
  final int? total;

  ShipmentsMeta({this.currentPage, this.hasMore, this.total});

  factory ShipmentsMeta.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsMetaFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentsMetaToJson(this);
}
