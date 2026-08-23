import 'package:json_annotation/json_annotation.dart';

part 'personal_info_section.g.dart';

@JsonSerializable()
class PersonalInfoSection {
  String? key;
  String? label;

  PersonalInfoSection({this.key, this.label});

  factory PersonalInfoSection.fromJson(Map<String, dynamic> json) {
    return _$PersonalInfoSectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInfoSectionToJson(this);
}
