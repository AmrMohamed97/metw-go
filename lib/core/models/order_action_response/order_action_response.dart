import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'order_action_response.g.dart';

@JsonSerializable()
class OrderActionResponse {
  bool? success;
  String? message;
  Data? data;

  OrderActionResponse({this.success, this.message, this.data});

  factory OrderActionResponse.fromJson(Map<String, dynamic> json) {
    return _$OrderActionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderActionResponseToJson(this);
}
