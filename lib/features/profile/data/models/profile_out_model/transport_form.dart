import 'package:json_annotation/json_annotation.dart';

part 'transport_form.g.dart';

@JsonSerializable()
class TransportForm {
  String? title;
  @JsonKey(name: 'transport_type_id')
  num? transportTypeId;
  @JsonKey(name: 'transport_type_name')
  dynamic transportTypeName;
  @JsonKey(name: 'max_weight_kg')
  num? maxWeightKg;
  @JsonKey(name: 'max_volume_m3')
  num? maxVolumeM3;
  @JsonKey(name: 'plate_number')
  String? plateNumber;
  @JsonKey(name: 'vehicle_brand')
  String? vehicleBrand;
  @JsonKey(name: 'vehicle_model')
  String? vehicleModel;
  @JsonKey(name: 'registration_plate_letters')
  String? registrationPlateLetters;
  @JsonKey(name: 'registration_plate_numbers')
  String? registrationPlateNumbers;
  @JsonKey(name: 'vehicle_image_url')
  dynamic vehicleImageUrl;
  @JsonKey(name: 'save_button_label')
  String? saveButtonLabel;

  TransportForm({
    this.title,
    this.transportTypeId,
    this.transportTypeName,
    this.maxWeightKg,
    this.maxVolumeM3,
    this.plateNumber,
    this.vehicleBrand,
    this.vehicleModel,
    this.registrationPlateLetters,
    this.registrationPlateNumbers,
    this.vehicleImageUrl,
    this.saveButtonLabel,
  });

  factory TransportForm.fromJson(Map<String, dynamic> json) {
    return _$TransportFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransportFormToJson(this);
}
