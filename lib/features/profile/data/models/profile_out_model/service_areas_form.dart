import 'package:json_annotation/json_annotation.dart';

import 'selected_governorate.dart';

part 'service_areas_form.g.dart';

@JsonSerializable()
class ServiceAreasForm {
  String? title;
  @JsonKey(name: 'selected_governorates')
  List<SelectedGovernorate>? selectedGovernorates;
  @JsonKey(name: 'selected_cities')
  List<dynamic>? selectedCities;
  @JsonKey(name: 'villages_service_enabled')
  bool? villagesServiceEnabled;
  @JsonKey(name: 'villages_service_note')
  String? villagesServiceNote;
  @JsonKey(name: 'save_button_label')
  String? saveButtonLabel;

  ServiceAreasForm({
    this.title,
    this.selectedGovernorates,
    this.selectedCities,
    this.villagesServiceEnabled,
    this.villagesServiceNote,
    this.saveButtonLabel,
  });

  factory ServiceAreasForm.fromJson(Map<String, dynamic> json) {
    return _$ServiceAreasFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceAreasFormToJson(this);
}
