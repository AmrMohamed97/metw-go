import 'package:json_annotation/json_annotation.dart';

import 'assignment.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	Assignment? assignment;

	Data({this.assignment});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
