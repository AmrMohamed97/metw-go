// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_areas_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceAreasForm _$ServiceAreasFormFromJson(Map<String, dynamic> json) =>
    ServiceAreasForm(
      title: json['title'] as String?,
      selectedGovernorates: (json['selected_governorates'] as List<dynamic>?)
          ?.map((e) => SelectedGovernorate.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedCities: json['selected_cities'] as List<dynamic>?,
      villagesServiceEnabled: json['villages_service_enabled'] as bool?,
      villagesServiceNote: json['villages_service_note'] as String?,
      saveButtonLabel: json['save_button_label'] as String?,
    );

Map<String, dynamic> _$ServiceAreasFormToJson(ServiceAreasForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selected_governorates': instance.selectedGovernorates,
      'selected_cities': instance.selectedCities,
      'villages_service_enabled': instance.villagesServiceEnabled,
      'villages_service_note': instance.villagesServiceNote,
      'save_button_label': instance.saveButtonLabel,
    };
