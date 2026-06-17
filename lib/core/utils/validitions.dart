 String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }
  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }
  String? firstPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first phone number';
    }
    return null;
  }
  String? secondPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your second phone number';
    }
    return null;
  }
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }
  String? boarnDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birth date';
    }
    return null;
  }
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your confirm password';
    }
    return null;
  }