import 'package:json_annotation/json_annotation.dart';

import 'change_password_fields.dart';

part 'personal_info_form.g.dart';

@JsonSerializable()
class PersonalInfoForm {
  String? title;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? phone;
  @JsonKey(name: 'secondary_phone')
  String? secondaryPhone;
  String? email;
  @JsonKey(name: 'birth_date')
  String? birthDate;
  String? gender;
  @JsonKey(name: 'change_password_fields')
  ChangePasswordFields? changePasswordFields;
  @JsonKey(name: 'save_button_label')
  String? saveButtonLabel;

  PersonalInfoForm({
    this.title,
    this.firstName,
    this.lastName,
    this.phone,
    this.secondaryPhone,
    this.email,
    this.birthDate,
    this.gender,
    this.changePasswordFields,
    this.saveButtonLabel,
  });

  factory PersonalInfoForm.fromJson(Map<String, dynamic> json) {
    return _$PersonalInfoFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInfoFormToJson(this);
}
