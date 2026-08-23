import 'package:json_annotation/json_annotation.dart';

part 'work_type_option.g.dart';

@JsonSerializable()
class WorkTypeOption {
  String? key;
  String? label;
  String? subtitle;

  WorkTypeOption({this.key, this.label, this.subtitle});

  factory WorkTypeOption.fromJson(Map<String, dynamic> json) {
    return _$WorkTypeOptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkTypeOptionToJson(this);
}
