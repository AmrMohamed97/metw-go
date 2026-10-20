import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'start_shipment_response.g.dart';

@JsonSerializable()
class StartShipmentResponse {
	bool? success;
	String? message;
	Data? data;

	StartShipmentResponse({this.success, this.message, this.data});

	factory StartShipmentResponse.fromJson(Map<String, dynamic> json) {
		return _$StartShipmentResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StartShipmentResponseToJson(this);
}
