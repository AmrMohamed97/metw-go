import 'package:json_annotation/json_annotation.dart';

part 'point_tab.g.dart';

@JsonSerializable()
class PointTab {
  num? index;
  String? label;
  @JsonKey(name: 'is_active')
  bool? isActive;

  PointTab({this.index, this.label, this.isActive});

  factory PointTab.fromJson(Map<String, dynamic> json) {
    return _$PointTabFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PointTabToJson(this);
}
