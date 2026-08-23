import 'package:json_annotation/json_annotation.dart';

part 'change_password_fields.g.dart';

@JsonSerializable()
class ChangePasswordFields {
  @JsonKey(name: 'current_password_label')
  String? currentPasswordLabel;
  @JsonKey(name: 'new_password_label')
  String? newPasswordLabel;
  @JsonKey(name: 'new_password_confirmation_label')
  String? newPasswordConfirmationLabel;
  String? endpoint;

  ChangePasswordFields({
    this.currentPasswordLabel,
    this.newPasswordLabel,
    this.newPasswordConfirmationLabel,
    this.endpoint,
  });

  factory ChangePasswordFields.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordFieldsToJson(this);
}
