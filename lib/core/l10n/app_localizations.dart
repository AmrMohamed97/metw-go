import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @startCreatingProfile.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start creating your profile as a delegate in MetwGo'**
  String get startCreatingProfile;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @exampleAhmed.
  ///
  /// In en, this message translates to:
  /// **'Example: Ahmed'**
  String get exampleAhmed;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @exampleMohamed.
  ///
  /// In en, this message translates to:
  /// **'Example: Mohamed'**
  String get exampleMohamed;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @anotherPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Another Phone Number'**
  String get anotherPhoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthDate;

  /// No description provided for @detailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Detailed Address'**
  String get detailedAddress;

  /// No description provided for @cityNeighborhoodStreet.
  ///
  /// In en, this message translates to:
  /// **'City / Neighborhood / Street'**
  String get cityNeighborhoodStreet;

  /// No description provided for @addressHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your address details here so the system can determine your work scope'**
  String get addressHintText;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @errEnterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get errEnterFirstName;

  /// No description provided for @errEnterLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get errEnterLastName;

  /// No description provided for @errEnterFirstPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first phone number'**
  String get errEnterFirstPhone;

  /// No description provided for @errEnterSecondPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your second phone number'**
  String get errEnterSecondPhone;

  /// No description provided for @errEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get errEnterEmail;

  /// No description provided for @errEnterBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birth date'**
  String get errEnterBirthDate;

  /// No description provided for @errEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get errEnterPassword;

  /// No description provided for @errEnterConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your confirm password'**
  String get errEnterConfirmPassword;

  /// No description provided for @errEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get errEnterAddress;

  /// No description provided for @delegateInfo.
  ///
  /// In en, this message translates to:
  /// **'Delegate Information'**
  String get delegateInfo;

  /// No description provided for @delegateType.
  ///
  /// In en, this message translates to:
  /// **'Delegate Type'**
  String get delegateType;

  /// No description provided for @warehouseDelegate.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Delegate'**
  String get warehouseDelegate;

  /// No description provided for @independentDelegate.
  ///
  /// In en, this message translates to:
  /// **'Independent Delegate'**
  String get independentDelegate;

  /// No description provided for @warehouseNumber.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Number'**
  String get warehouseNumber;

  /// No description provided for @chooseWarehouseNumber.
  ///
  /// In en, this message translates to:
  /// **'Choose Warehouse Number'**
  String get chooseWarehouseNumber;

  /// No description provided for @workClassification.
  ///
  /// In en, this message translates to:
  /// **'Work Classification'**
  String get workClassification;

  /// No description provided for @chooseMultipleClassifications.
  ///
  /// In en, this message translates to:
  /// **'You can choose more than one classification based on your work scope.'**
  String get chooseMultipleClassifications;

  /// No description provided for @deliveryDelegate.
  ///
  /// In en, this message translates to:
  /// **'Delivery Delegate'**
  String get deliveryDelegate;

  /// No description provided for @deliveryDelegateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery delegate within a governorate'**
  String get deliveryDelegateSubtitle;

  /// No description provided for @shippingDelegate.
  ///
  /// In en, this message translates to:
  /// **'Shipping Delegate'**
  String get shippingDelegate;

  /// No description provided for @shippingDelegateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shipping delegate between governorates'**
  String get shippingDelegateSubtitle;

  /// No description provided for @busDriver.
  ///
  /// In en, this message translates to:
  /// **'Bus Driver'**
  String get busDriver;

  /// No description provided for @busDriverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Transporting passengers and light goods'**
  String get busDriverSubtitle;

  /// No description provided for @higherProfitOpp.
  ///
  /// In en, this message translates to:
  /// **'Higher profit opportunities!'**
  String get higherProfitOpp;

  /// No description provided for @intercityShippingIncreasesIncome.
  ///
  /// In en, this message translates to:
  /// **'Activating intercity shipping options increases your income by 40%'**
  String get intercityShippingIncreasesIncome;

  /// No description provided for @errChooseWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Please choose a warehouse number'**
  String get errChooseWarehouse;

  /// No description provided for @errChooseWorkClassification.
  ///
  /// In en, this message translates to:
  /// **'Please choose at least one work classification'**
  String get errChooseWorkClassification;

  /// No description provided for @vehicleData.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Data'**
  String get vehicleData;

  /// No description provided for @transportMethod.
  ///
  /// In en, this message translates to:
  /// **'Transportation Method'**
  String get transportMethod;

  /// No description provided for @chooseTransportMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Transportation Method'**
  String get chooseTransportMethod;

  /// No description provided for @maxWeight.
  ///
  /// In en, this message translates to:
  /// **'Max Weight'**
  String get maxWeight;

  /// No description provided for @maxWeightHint.
  ///
  /// In en, this message translates to:
  /// **'20 kg'**
  String get maxWeightHint;

  /// No description provided for @maxVolume.
  ///
  /// In en, this message translates to:
  /// **'Max Volume'**
  String get maxVolume;

  /// No description provided for @maxVolumeHint.
  ///
  /// In en, this message translates to:
  /// **'0.05 c.m'**
  String get maxVolumeHint;

  /// No description provided for @plateNumber.
  ///
  /// In en, this message translates to:
  /// **'Plate Number'**
  String get plateNumber;

  /// No description provided for @plateNumberHint.
  ///
  /// In en, this message translates to:
  /// **'A B C - 1 2 3'**
  String get plateNumberHint;

  /// No description provided for @plateNumberDesc.
  ///
  /// In en, this message translates to:
  /// **'Please write the letters and numbers as they appear on the vehicle license'**
  String get plateNumberDesc;

  /// No description provided for @uploadVehicleImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Vehicle Image'**
  String get uploadVehicleImage;

  /// No description provided for @uploadVehicleImageDesc.
  ///
  /// In en, this message translates to:
  /// **'Max 5 MB JPG, PNG'**
  String get uploadVehicleImageDesc;

  /// No description provided for @vehicleDataWarning.
  ///
  /// In en, this message translates to:
  /// **'Ensure the data is entered accurately, as it will be matched with the official documents you will upload in the next step.'**
  String get vehicleDataWarning;

  /// No description provided for @errChooseTransportMethod.
  ///
  /// In en, this message translates to:
  /// **'Please choose transportation method'**
  String get errChooseTransportMethod;

  /// No description provided for @errEnterMaxWeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter max weight'**
  String get errEnterMaxWeight;

  /// No description provided for @errEnterMaxVolume.
  ///
  /// In en, this message translates to:
  /// **'Please enter max volume'**
  String get errEnterMaxVolume;

  /// No description provided for @errEnterPlateNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter plate number'**
  String get errEnterPlateNumber;

  /// No description provided for @errUploadVehicleImage.
  ///
  /// In en, this message translates to:
  /// **'Please upload vehicle image'**
  String get errUploadVehicleImage;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @chooseImageSource.
  ///
  /// In en, this message translates to:
  /// **'Choose Image Source'**
  String get chooseImageSource;

  /// No description provided for @serviceAreas.
  ///
  /// In en, this message translates to:
  /// **'Service Areas'**
  String get serviceAreas;

  /// No description provided for @serviceAreasDesc.
  ///
  /// In en, this message translates to:
  /// **'Specify the governorates and cities you will cover to ensure appropriate orders reach you.'**
  String get serviceAreasDesc;

  /// No description provided for @chooseGovernorates.
  ///
  /// In en, this message translates to:
  /// **'Choose governorates'**
  String get chooseGovernorates;

  /// No description provided for @governorates.
  ///
  /// In en, this message translates to:
  /// **'Governorates'**
  String get governorates;

  /// No description provided for @citiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get citiesTitle;

  /// No description provided for @cities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get cities;

  /// No description provided for @activateRuralService.
  ///
  /// In en, this message translates to:
  /// **'Activate rural service'**
  String get activateRuralService;

  /// No description provided for @ruralServiceDesc.
  ///
  /// In en, this message translates to:
  /// **'Working in surrounding rural areas'**
  String get ruralServiceDesc;

  /// No description provided for @ruralServiceWarning.
  ///
  /// In en, this message translates to:
  /// **'Activating rural service may increase your available orders by 25%, but ensure you have an appropriate transport method for rough roads.'**
  String get ruralServiceWarning;

  /// No description provided for @uploadOfficialDocs.
  ///
  /// In en, this message translates to:
  /// **'Upload official documents'**
  String get uploadOfficialDocs;

  /// No description provided for @uploadOfficialDocsDesc.
  ///
  /// In en, this message translates to:
  /// **'Please ensure image clarity before uploading'**
  String get uploadOfficialDocsDesc;

  /// No description provided for @personalPhoto.
  ///
  /// In en, this message translates to:
  /// **'Personal Photo'**
  String get personalPhoto;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// No description provided for @idFront.
  ///
  /// In en, this message translates to:
  /// **'Front side'**
  String get idFront;

  /// No description provided for @idBack.
  ///
  /// In en, this message translates to:
  /// **'Back side'**
  String get idBack;

  /// No description provided for @drivingLicense.
  ///
  /// In en, this message translates to:
  /// **'Driving License'**
  String get drivingLicense;

  /// No description provided for @frontSide.
  ///
  /// In en, this message translates to:
  /// **'Front side'**
  String get frontSide;

  /// No description provided for @backSide.
  ///
  /// In en, this message translates to:
  /// **'Back side'**
  String get backSide;

  /// No description provided for @vehicleLicense.
  ///
  /// In en, this message translates to:
  /// **'Vehicle License'**
  String get vehicleLicense;

  /// No description provided for @editPhoto.
  ///
  /// In en, this message translates to:
  /// **'Edit Photo'**
  String get editPhoto;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
