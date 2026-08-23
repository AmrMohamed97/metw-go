// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoForm _$PersonalInfoFormFromJson(Map<String, dynamic> json) =>
    PersonalInfoForm(
      title: json['title'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      secondaryPhone: json['secondary_phone'] as String?,
      email: json['email'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      changePasswordFields: json['change_password_fields'] == null
          ? null
          : ChangePasswordFields.fromJson(
              json['change_password_fields'] as Map<String, dynamic>,
            ),
      saveButtonLabel: json['save_button_label'] as String?,
    );

Map<String, dynamic> _$PersonalInfoFormToJson(PersonalInfoForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'secondary_phone': instance.secondaryPhone,
      'email': instance.email,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'change_password_fields': instance.changePasswordFields,
      'save_button_label': instance.saveButtonLabel,
    };
