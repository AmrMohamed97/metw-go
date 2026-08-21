import 'package:json_annotation/json_annotation.dart';

part 'map.g.dart';

@JsonSerializable()
class DropoffMap {
  String? label;
  num? latitude;
  num? longitude;

  DropoffMap({this.label, this.latitude, this.longitude});

  factory DropoffMap.fromJson(Map<String, dynamic> json) => _$DropoffMapFromJson(json);

  Map<String, dynamic> toJson() => _$DropoffMapToJson(this);
}
