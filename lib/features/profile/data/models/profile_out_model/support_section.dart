import 'package:json_annotation/json_annotation.dart';

part 'support_section.g.dart';

@JsonSerializable()
class SupportSection {
  String? key;
  String? label;

  SupportSection({this.key, this.label});

  factory SupportSection.fromJson(Map<String, dynamic> json) {
    return _$SupportSectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SupportSectionToJson(this);
}
