import 'package:json_annotation/json_annotation.dart';

part 'courier_type_option.g.dart';

@JsonSerializable()
class CourierTypeOption {
  String? key;
  String? label;

  CourierTypeOption({this.key, this.label});

  factory CourierTypeOption.fromJson(Map<String, dynamic> json) {
    return _$CourierTypeOptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourierTypeOptionToJson(this);
}
