import 'package:json_annotation/json_annotation.dart';
import 'order_model.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  bool? success;
  String? message;
  OrderModel? data;

  OrderDetailsResponse({this.success, this.message, this.data});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}
