import 'package:json_annotation/json_annotation.dart';

import 'personal_info_section.dart';
import 'settings_section.dart';
import 'stats_card.dart';
import 'support_section.dart';

part 'profile_home.g.dart';

@JsonSerializable()
class ProfileHome {
  String? title;
  String? avatar;
  String? name;
  num? rating;
  @JsonKey(name: 'courier_code')
  String? courierCode;
  @JsonKey(name: 'stats_cards')
  List<StatsCard>? statsCards;
  @JsonKey(name: 'personal_info_sections')
  List<PersonalInfoSection>? personalInfoSections;
  @JsonKey(name: 'settings_sections')
  List<SettingsSection>? settingsSections;
  @JsonKey(name: 'support_sections')
  List<SupportSection>? supportSections;
  @JsonKey(name: 'logout_label')
  String? logoutLabel;

  ProfileHome({
    this.title,
    this.avatar,
    this.name,
    this.rating,
    this.courierCode,
    this.statsCards,
    this.personalInfoSections,
    this.settingsSections,
    this.supportSections,
    this.logoutLabel,
  });

  factory ProfileHome.fromJson(Map<String, dynamic> json) {
    return _$ProfileHomeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileHomeToJson(this);
}
