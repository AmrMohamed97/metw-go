import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('pickup')
  pickup,
  @JsonValue('on_way')
  onWay,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('rejected')
  rejected,
  @JsonValue('returned')
  returned,
}
