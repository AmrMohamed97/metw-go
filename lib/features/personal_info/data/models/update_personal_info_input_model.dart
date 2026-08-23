import 'package:json_annotation/json_annotation.dart';

part 'update_personal_info_input_model.g.dart';

@JsonSerializable()
class UpdatePersonalInfoInputModel {
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
  @JsonKey(name: 'birth_date')
  String? birthDate;
  String? gender;
  @JsonKey(name: 'address_details')
  String? addressDetails;

  UpdatePersonalInfoInputModel({
    this.firstName,
    this.fatherName,
    this.lastName,
    this.phone,
    this.secondaryPhone,
    this.email,
    this.birthDate,
    this.gender,
    this.addressDetails,
  });

  factory UpdatePersonalInfoInputModel.fromJson(Map<String, dynamic> json) {
    return _$UpdatePersonalInfoInputModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdatePersonalInfoInputModelToJson(this);
}
