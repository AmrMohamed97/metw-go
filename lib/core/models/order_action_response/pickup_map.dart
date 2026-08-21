import 'package:json_annotation/json_annotation.dart';

part 'pickup_map.g.dart';

@JsonSerializable()
class PickupMap {
  String? label;
  String? address;
  num? latitude;
  num? longitude;

  PickupMap({this.label, this.address, this.latitude, this.longitude});

  factory PickupMap.fromJson(Map<String, dynamic> json) {
    return _$PickupMapFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PickupMapToJson(this);
}
