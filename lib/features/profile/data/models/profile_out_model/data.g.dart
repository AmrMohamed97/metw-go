// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as num?,
  accountNumber: json['account_number'] as String?,
  accountOpenedAt: json['account_opened_at'],
  name: json['name'] as String?,
  firstName: json['first_name'] as String?,
  fatherName: json['father_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  secondaryPhone: json['secondary_phone'] as String?,
  email: json['email'] as String?,
  verification: json['verification'] == null
      ? null
      : Verification.fromJson(json['verification'] as Map<String, dynamic>),
  birthDate: json['birth_date'] as String?,
  gender: json['gender'] as String?,
  addressDetails: json['address_details'] as String?,
  avatar: json['avatar'] as String?,
  rating: json['rating'] as num?,
  courierType: json['courier_type'] as String?,
  warehouseId: json['warehouse_id'] as num?,
  workTypes: (json['work_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  governorateIds: (json['governorate_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  cityIds: json['city_ids'] as List<dynamic>?,
  villagesServiceEnabled: json['villages_service_enabled'] as bool?,
  approvalStatus: json['approval_status'] as String?,
  profileHome: json['profile_home'] == null
      ? null
      : ProfileHome.fromJson(json['profile_home'] as Map<String, dynamic>),
  personalInfoForm: json['personal_info_form'] == null
      ? null
      : PersonalInfoForm.fromJson(
          json['personal_info_form'] as Map<String, dynamic>,
        ),
  workInfoForm: json['work_info_form'] == null
      ? null
      : WorkInfoForm.fromJson(json['work_info_form'] as Map<String, dynamic>),
  transport: json['transport'] == null
      ? null
      : Transport.fromJson(json['transport'] as Map<String, dynamic>),
  transportForm: json['transport_form'] == null
      ? null
      : TransportForm.fromJson(json['transport_form'] as Map<String, dynamic>),
  serviceAreasForm: json['service_areas_form'] == null
      ? null
      : ServiceAreasForm.fromJson(
          json['service_areas_form'] as Map<String, dynamic>,
        ),
  documents: (json['documents'] as List<dynamic>?)
      ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
      .toList(),
  documentsForm: json['documents_form'] == null
      ? null
      : DocumentsForm.fromJson(json['documents_form'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'account_number': instance.accountNumber,
  'account_opened_at': instance.accountOpenedAt,
  'name': instance.name,
  'first_name': instance.firstName,
  'father_name': instance.fatherName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'secondary_phone': instance.secondaryPhone,
  'email': instance.email,
  'verification': instance.verification,
  'birth_date': instance.birthDate,
  'gender': instance.gender,
  'address_details': instance.addressDetails,
  'avatar': instance.avatar,
  'rating': instance.rating,
  'courier_type': instance.courierType,
  'warehouse_id': instance.warehouseId,
  'work_types': instance.workTypes,
  'governorate_ids': instance.governorateIds,
  'city_ids': instance.cityIds,
  'villages_service_enabled': instance.villagesServiceEnabled,
  'approval_status': instance.approvalStatus,
  'profile_home': instance.profileHome,
  'personal_info_form': instance.personalInfoForm,
  'work_info_form': instance.workInfoForm,
  'transport': instance.transport,
  'transport_form': instance.transportForm,
  'service_areas_form': instance.serviceAreasForm,
  'documents': instance.documents,
  'documents_form': instance.documentsForm,
};
