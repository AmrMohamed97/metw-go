// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileHome _$ProfileHomeFromJson(Map<String, dynamic> json) => ProfileHome(
  title: json['title'] as String?,
  avatar: json['avatar'] as String?,
  name: json['name'] as String?,
  rating: json['rating'] as num?,
  courierCode: json['courier_code'] as String?,
  statsCards: (json['stats_cards'] as List<dynamic>?)
      ?.map((e) => StatsCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  personalInfoSections: (json['personal_info_sections'] as List<dynamic>?)
      ?.map((e) => PersonalInfoSection.fromJson(e as Map<String, dynamic>))
      .toList(),
  settingsSections: (json['settings_sections'] as List<dynamic>?)
      ?.map((e) => SettingsSection.fromJson(e as Map<String, dynamic>))
      .toList(),
  supportSections: (json['support_sections'] as List<dynamic>?)
      ?.map((e) => SupportSection.fromJson(e as Map<String, dynamic>))
      .toList(),
  logoutLabel: json['logout_label'] as String?,
);

Map<String, dynamic> _$ProfileHomeToJson(ProfileHome instance) =>
    <String, dynamic>{
      'title': instance.title,
      'avatar': instance.avatar,
      'name': instance.name,
      'rating': instance.rating,
      'courier_code': instance.courierCode,
      'stats_cards': instance.statsCards,
      'personal_info_sections': instance.personalInfoSections,
      'settings_sections': instance.settingsSections,
      'support_sections': instance.supportSections,
      'logout_label': instance.logoutLabel,
    };
