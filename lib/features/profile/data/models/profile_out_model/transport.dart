import 'package:json_annotation/json_annotation.dart';

part 'transport.g.dart';

@JsonSerializable()
class Transport {
  @JsonKey(name: 'transport_type_id')
  num? transportTypeId;
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
  @JsonKey(name: 'max_weight_kg')
  num? maxWeightKg;
  @JsonKey(name: 'max_volume_m3')
  num? maxVolumeM3;
  @JsonKey(name: 'vehicle_image_url')
  dynamic vehicleImageUrl;

  Transport({
    this.transportTypeId,
    this.plateNumber,
    this.vehicleBrand,
    this.vehicleModel,
    this.registrationPlateLetters,
    this.registrationPlateNumbers,
    this.maxWeightKg,
    this.maxVolumeM3,
    this.vehicleImageUrl,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return _$TransportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransportToJson(this);
}
