// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportForm _$TransportFormFromJson(Map<String, dynamic> json) =>
    TransportForm(
      title: json['title'] as String?,
      transportTypeId: json['transport_type_id'] as num?,
      transportTypeName: json['transport_type_name'],
      maxWeightKg: json['max_weight_kg'] as num?,
      maxVolumeM3: json['max_volume_m3'] as num?,
      plateNumber: json['plate_number'] as String?,
      vehicleBrand: json['vehicle_brand'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      registrationPlateLetters: json['registration_plate_letters'] as String?,
      registrationPlateNumbers: json['registration_plate_numbers'] as String?,
      vehicleImageUrl: json['vehicle_image_url'],
      saveButtonLabel: json['save_button_label'] as String?,
    );

Map<String, dynamic> _$TransportFormToJson(TransportForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'transport_type_id': instance.transportTypeId,
      'transport_type_name': instance.transportTypeName,
      'max_weight_kg': instance.maxWeightKg,
      'max_volume_m3': instance.maxVolumeM3,
      'plate_number': instance.plateNumber,
      'vehicle_brand': instance.vehicleBrand,
      'vehicle_model': instance.vehicleModel,
      'registration_plate_letters': instance.registrationPlateLetters,
      'registration_plate_numbers': instance.registrationPlateNumbers,
      'vehicle_image_url': instance.vehicleImageUrl,
      'save_button_label': instance.saveButtonLabel,
    };
