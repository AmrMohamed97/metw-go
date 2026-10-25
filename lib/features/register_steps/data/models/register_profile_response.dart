class RegisterProfileResponse {
  final bool? success;
  final String? message;
  final RegisterProfileData? data;

  RegisterProfileResponse({this.success, this.message, this.data});

  factory RegisterProfileResponse.fromJson(Map<String, dynamic> json) {
    return RegisterProfileResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null && json['data'] is Map<String, dynamic>
          ? RegisterProfileData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}

class RegisterProfileData {
  final int? currentStep;
  final String? approvalStatus;
  final RegisterProfile? profile;

  RegisterProfileData({this.currentStep, this.approvalStatus, this.profile});

  factory RegisterProfileData.fromJson(Map<String, dynamic> json) {
    return RegisterProfileData(
      currentStep: json['current_step'] as int?,
      approvalStatus: json['approval_status'] as String?,
      profile: json['profile'] != null && json['profile'] is Map<String, dynamic>
          ? RegisterProfile.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'current_step': currentStep,
        'approval_status': approvalStatus,
        'profile': profile?.toJson(),
      };
}

class RegisterProfile {
  final int? id;
  final String? name;
  final String? courierType;
  final List<String> workTypes;
  final List<int> governorateIds;
  final List<int> cityIds;
  final bool? villagesServiceEnabled;

  RegisterProfile({
    this.id,
    this.name,
    this.courierType,
    this.workTypes = const [],
    this.governorateIds = const [],
    this.cityIds = const [],
    this.villagesServiceEnabled,
  });

  factory RegisterProfile.fromJson(Map<String, dynamic> json) {
    return RegisterProfile(
      id: json['id'] as int?,
      name: json['name'] as String?,
      courierType: json['courier_type'] as String?,
      workTypes: (json['work_types'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      governorateIds: (json['governorate_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      cityIds: (json['city_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      villagesServiceEnabled: json['villages_service_enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'courier_type': courierType,
        'work_types': workTypes,
        'governorate_ids': governorateIds,
        'city_ids': cityIds,
        'villages_service_enabled': villagesServiceEnabled,
      };
}
