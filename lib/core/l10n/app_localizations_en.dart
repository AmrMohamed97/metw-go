// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get gender => 'Gender';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get startCreatingProfile =>
      'Let\'s start creating your profile as a delegate in MetwGo';

  @override
  String get firstName => 'First Name';

  @override
  String get exampleAhmed => 'Example: Ahmed';

  @override
  String get lastName => 'Last Name';

  @override
  String get exampleMohamed => 'Example: Mohamed';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get anotherPhoneNumber => 'Another Phone Number';

  @override
  String get email => 'Email';

  @override
  String get birthDate => 'Date of Birth';

  @override
  String get detailedAddress => 'Detailed Address';

  @override
  String get cityNeighborhoodStreet => 'City / Neighborhood / Street';

  @override
  String get addressHintText =>
      'Enter your address details here so the system can determine your work scope';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get next => 'Next';

  @override
  String get errEnterFirstName => 'Please enter your first name';

  @override
  String get errEnterLastName => 'Please enter your last name';

  @override
  String get errEnterFirstPhone => 'Please enter your first phone number';

  @override
  String get errEnterSecondPhone => 'Please enter your second phone number';

  @override
  String get errEnterEmail => 'Please enter your email';

  @override
  String get errEnterBirthDate => 'Please enter your birth date';

  @override
  String get errEnterPassword => 'Please enter your password';

  @override
  String get errEnterConfirmPassword => 'Please enter your confirm password';

  @override
  String get errEnterAddress => 'Please enter your address';

  @override
  String get delegateInfo => 'Delegate Information';

  @override
  String get delegateType => 'Delegate Type';

  @override
  String get warehouseDelegate => 'Warehouse Delegate';

  @override
  String get independentDelegate => 'Independent Delegate';

  @override
  String get warehouseNumber => 'Warehouse Number';

  @override
  String get chooseWarehouseNumber => 'Choose Warehouse Number';

  @override
  String get workClassification => 'Work Classification';

  @override
  String get chooseMultipleClassifications =>
      'You can choose more than one classification based on your work scope.';

  @override
  String get deliveryDelegate => 'Delivery Delegate';

  @override
  String get deliveryDelegateSubtitle =>
      'Delivery delegate within a governorate';

  @override
  String get shippingDelegate => 'Shipping Delegate';

  @override
  String get shippingDelegateSubtitle =>
      'Shipping delegate between governorates';

  @override
  String get busDriver => 'Bus Driver';

  @override
  String get busDriverSubtitle => 'Transporting passengers and light goods';

  @override
  String get higherProfitOpp => 'Higher profit opportunities!';

  @override
  String get intercityShippingIncreasesIncome =>
      'Activating intercity shipping options increases your income by 40%';

  @override
  String get errChooseWarehouse => 'Please choose a warehouse number';

  @override
  String get errChooseWorkClassification =>
      'Please choose at least one work classification';
}
