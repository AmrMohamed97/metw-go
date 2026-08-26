import 'package:json_annotation/json_annotation.dart';

import 'courier.dart';
import 'incoming_order.dart';
import 'notifications.dart';
import 'stats.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Courier? courier;
  Stats? stats;
  Notifications? notifications;
  @JsonKey(name: 'incoming_orders')
  List<IncomingOrder>? incomingOrders;
  @JsonKey(name: 'active_order')
  dynamic activeOrder;

  Data({
    this.courier,
    this.stats,
    this.notifications,
    this.incomingOrders,
    this.activeOrder,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
