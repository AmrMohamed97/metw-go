// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transport _$TransportFromJson(Map<String, dynamic> json) => Transport(
  transportTypeId: json['transport_type_id'] as num?,
  plateNumber: json['plate_number'] as String?,
  vehicleBrand: json['vehicle_brand'] as String?,
  vehicleModel: json['vehicle_model'] as String?,
  registrationPlateLetters: json['registration_plate_letters'] as String?,
  registrationPlateNumbers: json['registration_plate_numbers'] as String?,
  maxWeightKg: json['max_weight_kg'] as num?,
  maxVolumeM3: json['max_volume_m3'] as num?,
  vehicleImageUrl: json['vehicle_image_url'],
);

Map<String, dynamic> _$TransportToJson(Transport instance) => <String, dynamic>{
  'transport_type_id': instance.transportTypeId,
  'plate_number': instance.plateNumber,
  'vehicle_brand': instance.vehicleBrand,
  'vehicle_model': instance.vehicleModel,
  'registration_plate_letters': instance.registrationPlateLetters,
  'registration_plate_numbers': instance.registrationPlateNumbers,
  'max_weight_kg': instance.maxWeightKg,
  'max_volume_m3': instance.maxVolumeM3,
  'vehicle_image_url': instance.vehicleImageUrl,
};
