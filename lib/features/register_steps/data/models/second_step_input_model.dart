class SecondStepInputModel {
  final int transportTypeId;
  final String plateNumber;
  final String vehicleBrand;
  final String vehicleModel;
  final String? registrationPlateLetters;

  SecondStepInputModel({
    required this.transportTypeId,
    required this.plateNumber,
    required this.vehicleBrand,
    required this.vehicleModel,
    this.registrationPlateLetters,
  });

  Map<String, dynamic> toJson() => {
        'transport_type_id': transportTypeId,
        'plate_number': plateNumber,
        'vehicle_brand': vehicleBrand,
        'vehicle_model': vehicleModel,
        if (registrationPlateLetters != null &&
            registrationPlateLetters!.isNotEmpty)
          'registration_plate_letters': registrationPlateLetters,
      };

  factory SecondStepInputModel.fromJson(Map<String, dynamic> json) =>
      SecondStepInputModel(
        transportTypeId: json['transport_type_id'] as int,
        plateNumber: json['plate_number'] as String,
        vehicleBrand: json['vehicle_brand'] as String,
        vehicleModel: json['vehicle_model'] as String,
        registrationPlateLetters: json['registration_plate_letters'] as String?,
      );
}
