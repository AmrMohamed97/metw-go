import 'package:json_annotation/json_annotation.dart';

import 'document.dart';
import 'documents_form.dart';
import 'personal_info_form.dart';
import 'profile_home.dart';
import 'service_areas_form.dart';
import 'transport.dart';
import 'transport_form.dart';
import 'verification.dart';
import 'work_info_form.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_opened_at')
  dynamic accountOpenedAt;
  String? name;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'father_name')
  String? fatherName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? phone;
  @JsonKey(name: 'secondary_phone')
  String? secondaryPhone;
  String? email;
  Verification? verification;
  @JsonKey(name: 'birth_date')
  String? birthDate;
  String? gender;
  @JsonKey(name: 'address_details')
  String? addressDetails;
  String? avatar;
  num? rating;
  @JsonKey(name: 'courier_type')
  String? courierType;
  @JsonKey(name: 'warehouse_id')
  num? warehouseId;
  @JsonKey(name: 'work_types')
  List<String>? workTypes;
  @JsonKey(name: 'governorate_ids')
  List<int>? governorateIds;
  @JsonKey(name: 'city_ids')
  List<dynamic>? cityIds;
  @JsonKey(name: 'villages_service_enabled')
  bool? villagesServiceEnabled;
  @JsonKey(name: 'approval_status')
  String? approvalStatus;
  @JsonKey(name: 'profile_home')
  ProfileHome? profileHome;
  @JsonKey(name: 'personal_info_form')
  PersonalInfoForm? personalInfoForm;
  @JsonKey(name: 'work_info_form')
  WorkInfoForm? workInfoForm;
  Transport? transport;
  @JsonKey(name: 'transport_form')
  TransportForm? transportForm;
  @JsonKey(name: 'service_areas_form')
  ServiceAreasForm? serviceAreasForm;
  List<Document>? documents;
  @JsonKey(name: 'documents_form')
  DocumentsForm? documentsForm;

  Data({
    this.id,
    this.accountNumber,
    this.accountOpenedAt,
    this.name,
    this.firstName,
    this.fatherName,
    this.lastName,
    this.phone,
    this.secondaryPhone,
    this.email,
    this.verification,
    this.birthDate,
    this.gender,
    this.addressDetails,
    this.avatar,
    this.rating,
    this.courierType,
    this.warehouseId,
    this.workTypes,
    this.governorateIds,
    this.cityIds,
    this.villagesServiceEnabled,
    this.approvalStatus,
    this.profileHome,
    this.personalInfoForm,
    this.workInfoForm,
    this.transport,
    this.transportForm,
    this.serviceAreasForm,
    this.documents,
    this.documentsForm,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
