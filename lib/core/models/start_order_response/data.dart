import 'package:json_annotation/json_annotation.dart';

import 'active_order.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'active_order')
  ActiveOrder? activeOrder;

  Data({this.activeOrder});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
