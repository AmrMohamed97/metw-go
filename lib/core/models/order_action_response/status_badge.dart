import 'package:json_annotation/json_annotation.dart';

part 'status_badge.g.dart';

@JsonSerializable()
class StatusBadge {
  String? key;
  String? label;

  StatusBadge({this.key, this.label});

  factory StatusBadge.fromJson(Map<String, dynamic> json) {
    return _$StatusBadgeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusBadgeToJson(this);
}
