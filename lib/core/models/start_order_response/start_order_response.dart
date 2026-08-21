import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'start_order_response.g.dart';

@JsonSerializable()
class StartOrderResponse {
  bool? success;
  String? message;
  Data? data;

  StartOrderResponse({this.success, this.message, this.data});

  factory StartOrderResponse.fromJson(Map<String, dynamic> json) {
    return _$StartOrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StartOrderResponseToJson(this);
}
