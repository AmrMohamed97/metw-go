class FifthStepInputModel {
  final String nationalIdNumber;
  final String nationalIdExpiresAt;
  final String drivingLicenseNumber;
  final String drivingLicenseExpiresAt;
  final String vehicleLicenseNumber;
  final String vehicleLicenseExpiresAt;

  FifthStepInputModel({
    required this.nationalIdNumber,
    required this.nationalIdExpiresAt,
    required this.drivingLicenseNumber,
    required this.drivingLicenseExpiresAt,
    required this.vehicleLicenseNumber,
    required this.vehicleLicenseExpiresAt,
  });

  Map<String, dynamic> toJson() => {
        'national_id_number': nationalIdNumber,
        'national_id_expires_at': nationalIdExpiresAt,
        'driving_license_number': drivingLicenseNumber,
        'driving_license_expires_at': drivingLicenseExpiresAt,
        'vehicle_license_number': vehicleLicenseNumber,
        'vehicle_license_expires_at': vehicleLicenseExpiresAt,
      };

  factory FifthStepInputModel.fromJson(Map<String, dynamic> json) =>
      FifthStepInputModel(
        nationalIdNumber: json['national_id_number'] as String,
        nationalIdExpiresAt: json['national_id_expires_at'] as String,
        drivingLicenseNumber: json['driving_license_number'] as String,
        drivingLicenseExpiresAt: json['driving_license_expires_at'] as String,
        vehicleLicenseNumber: json['vehicle_license_number'] as String,
        vehicleLicenseExpiresAt: json['vehicle_license_expires_at'] as String,
      );
}
