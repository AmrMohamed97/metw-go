import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';

String? firstNameValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterFirstName;
  }
  return null;
}
String? lastNameValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterLastName;
  }
  return null;
}
String? firstPhoneValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterFirstPhone;
  }
  return null;
}
String? secondPhoneValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterSecondPhone;
  }
  return null;
}
String? emailValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterEmail;
  }
  return null;
}
String? boarnDateValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterBirthDate;
  }
  return null;
}
String?  addressValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterAddress;
  }
  return null;
}
String? passwordValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterPassword;
  }
  return null;
}
String? confirmPasswordValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errEnterConfirmPassword;
  }
  return null;
}