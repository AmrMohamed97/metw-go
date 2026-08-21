import 'package:json_annotation/json_annotation.dart';

part 'active_order.g.dart';

@JsonSerializable()
class ActiveOrder {
  num? id;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  String? status;
  String? label;

  ActiveOrder({this.id, this.orderNumber, this.status, this.label});

  factory ActiveOrder.fromJson(Map<String, dynamic> json) {
    return _$ActiveOrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActiveOrderToJson(this);
}
