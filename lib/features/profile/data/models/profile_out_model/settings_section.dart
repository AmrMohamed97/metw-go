import 'package:json_annotation/json_annotation.dart';

part 'settings_section.g.dart';

@JsonSerializable()
class SettingsSection {
  String? key;
  String? label;
  bool? enabled;
  String? value;

  SettingsSection({this.key, this.label, this.enabled, this.value});

  factory SettingsSection.fromJson(Map<String, dynamic> json) {
    return _$SettingsSectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SettingsSectionToJson(this);
}
