import 'package:json_annotation/json_annotation.dart';

import 'order.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Order? order;

  Data({this.order});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
