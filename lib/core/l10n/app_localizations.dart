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

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Did you forget your password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! This happens sometimes. Please enter the phone number associated with your account.'**
  String get forgotPasswordDesc;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changePasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'The new password will help you keep your data safe'**
  String get changePasswordDesc;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get enterCode;

  /// No description provided for @enterCodeDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter the 4-digit code we just sent to\n+2010*******000'**
  String get enterCodeDesc;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @thanksForJoining.
  ///
  /// In en, this message translates to:
  /// **'Thank you for joining us'**
  String get thanksForJoining;

  /// No description provided for @accountUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Your account is under review, and we will notify you once it is approved and ready for activation.'**
  String get accountUnderReview;

  /// No description provided for @todayEarnings.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Earnings'**
  String get todayEarnings;

  /// No description provided for @completedOrders.
  ///
  /// In en, this message translates to:
  /// **'Completed Orders'**
  String get completedOrders;

  /// No description provided for @outOf18Planned.
  ///
  /// In en, this message translates to:
  /// **'out of 18 planned'**
  String get outOf18Planned;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @withdrawBalance.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Balance'**
  String get withdrawBalance;

  /// No description provided for @unavailableForWork.
  ///
  /// In en, this message translates to:
  /// **'Unavailable for work'**
  String get unavailableForWork;

  /// No description provided for @activateStatusToReceiveOrders.
  ///
  /// In en, this message translates to:
  /// **'Activate your status to receive new delivery orders in your area.'**
  String get activateStatusToReceiveOrders;

  /// No description provided for @readyToReceive.
  ///
  /// In en, this message translates to:
  /// **'Ready to receive'**
  String get readyToReceive;

  /// No description provided for @availableToReceive.
  ///
  /// In en, this message translates to:
  /// **'Available to receive'**
  String get availableToReceive;

  /// No description provided for @onlineWaitingForOrders.
  ///
  /// In en, this message translates to:
  /// **'You are online, waiting for upcoming orders.'**
  String get onlineWaitingForOrders;

  /// No description provided for @stopReceiving.
  ///
  /// In en, this message translates to:
  /// **'Stop receiving'**
  String get stopReceiving;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @todayOrders.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Orders'**
  String get todayOrders;

  /// No description provided for @scheduledOrders.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Orders'**
  String get scheduledOrders;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @deliveryProfitsMock.
  ///
  /// In en, this message translates to:
  /// **'Delivery profits - #1245'**
  String get deliveryProfitsMock;

  /// No description provided for @todayTimeMock.
  ///
  /// In en, this message translates to:
  /// **'Today, 02:30 PM'**
  String get todayTimeMock;

  /// No description provided for @amountMock.
  ///
  /// In en, this message translates to:
  /// **'+45.00 EGP'**
  String get amountMock;

  /// No description provided for @statsAmountMock.
  ///
  /// In en, this message translates to:
  /// **'145.00 EGP'**
  String get statsAmountMock;

  /// No description provided for @statsPercentageMock.
  ///
  /// In en, this message translates to:
  /// **'12%+'**
  String get statsPercentageMock;

  /// No description provided for @statsOrdersCountMock.
  ///
  /// In en, this message translates to:
  /// **'12 orders'**
  String get statsOrdersCountMock;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @weekPerformance.
  ///
  /// In en, this message translates to:
  /// **'Week Performance'**
  String get weekPerformance;

  /// No description provided for @totalAmountMock.
  ///
  /// In en, this message translates to:
  /// **'Total: 3.4 EGP'**
  String get totalAmountMock;

  /// No description provided for @fridayInitial.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get fridayInitial;

  /// No description provided for @thursdayInitial.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get thursdayInitial;

  /// No description provided for @wednesdayInitial.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get wednesdayInitial;

  /// No description provided for @tuesdayInitial.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get tuesdayInitial;

  /// No description provided for @mondayInitial.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get mondayInitial;

  /// No description provided for @sundayInitial.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get sundayInitial;

  /// No description provided for @saturdayInitial.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get saturdayInitial;

  /// No description provided for @upcomingOrders.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Orders'**
  String get upcomingOrders;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @ahmedMohamed.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Mohamed'**
  String get ahmedMohamed;

  /// No description provided for @delegateIdMock.
  ///
  /// In en, this message translates to:
  /// **'CP-8842#'**
  String get delegateIdMock;

  /// No description provided for @ratingMock.
  ///
  /// In en, this message translates to:
  /// **'4.0'**
  String get ratingMock;

  /// No description provided for @totalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get totalEarnings;

  /// No description provided for @earningsValueMock.
  ///
  /// In en, this message translates to:
  /// **'15,420 EGP'**
  String get earningsValueMock;

  /// No description provided for @totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// No description provided for @totalOrdersValueMock.
  ///
  /// In en, this message translates to:
  /// **'1,248'**
  String get totalOrdersValueMock;

  /// No description provided for @completedOrdersValueMock.
  ///
  /// In en, this message translates to:
  /// **'1,210'**
  String get completedOrdersValueMock;

  /// No description provided for @personalData.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personalData;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @supportAndHelp.
  ///
  /// In en, this message translates to:
  /// **'Support and Help'**
  String get supportAndHelp;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @completedTab.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedTab;

  /// No description provided for @cancelledTab.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelledTab;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// No description provided for @merchant.
  ///
  /// In en, this message translates to:
  /// **'Merchant'**
  String get merchant;

  /// No description provided for @deliveredAt.
  ///
  /// In en, this message translates to:
  /// **'Delivered at'**
  String get deliveredAt;

  /// No description provided for @viewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View Receipt'**
  String get viewReceipt;

  /// No description provided for @fare.
  ///
  /// In en, this message translates to:
  /// **'Fare'**
  String get fare;

  /// No description provided for @cancelledStatus.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelledStatus;

  /// No description provided for @cancellationDate.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Date'**
  String get cancellationDate;

  /// No description provided for @dateTime.
  ///
  /// In en, this message translates to:
  /// **'Date and Time'**
  String get dateTime;

  /// No description provided for @mockOrderId1.
  ///
  /// In en, this message translates to:
  /// **'#MG-88285'**
  String get mockOrderId1;

  /// No description provided for @mockMerchant1.
  ///
  /// In en, this message translates to:
  /// **'Burger King - Al Muruj'**
  String get mockMerchant1;

  /// No description provided for @mockDate1.
  ///
  /// In en, this message translates to:
  /// **'Today, 12:15 PM'**
  String get mockDate1;

  /// No description provided for @mockFare1.
  ///
  /// In en, this message translates to:
  /// **'18.00 EGP'**
  String get mockFare1;

  /// No description provided for @mockOrderId2.
  ///
  /// In en, this message translates to:
  /// **'#MG-88270'**
  String get mockOrderId2;

  /// No description provided for @mockMerchant2.
  ///
  /// In en, this message translates to:
  /// **'Al Dawaa Pharmacy'**
  String get mockMerchant2;

  /// No description provided for @mockDate2.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 09:30 PM'**
  String get mockDate2;

  /// No description provided for @mockFare2.
  ///
  /// In en, this message translates to:
  /// **'00.00 EGP'**
  String get mockFare2;

  /// No description provided for @mockOrderId3.
  ///
  /// In en, this message translates to:
  /// **'#MG-88291'**
  String get mockOrderId3;

  /// No description provided for @mockMerchant3.
  ///
  /// In en, this message translates to:
  /// **'Al Mamlaka Sweets'**
  String get mockMerchant3;

  /// No description provided for @mockDate3.
  ///
  /// In en, this message translates to:
  /// **'Today, 02:45 PM'**
  String get mockDate3;

  /// No description provided for @mockFare3.
  ///
  /// In en, this message translates to:
  /// **'25.00 EGP'**
  String get mockFare3;

  /// No description provided for @immediateDeliveryOnePoint.
  ///
  /// In en, this message translates to:
  /// **'Immediate Delivery | One Point'**
  String get immediateDeliveryOnePoint;

  /// No description provided for @electronicPayment.
  ///
  /// In en, this message translates to:
  /// **'Electronic Payment'**
  String get electronicPayment;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @pickupPoint.
  ///
  /// In en, this message translates to:
  /// **'Pickup Point'**
  String get pickupPoint;

  /// No description provided for @point1.
  ///
  /// In en, this message translates to:
  /// **'Point 1'**
  String get point1;

  /// No description provided for @customerRating.
  ///
  /// In en, this message translates to:
  /// **'Customer Rating'**
  String get customerRating;

  /// No description provided for @profitDetails.
  ///
  /// In en, this message translates to:
  /// **'Profit Details'**
  String get profitDetails;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get netProfit;

  /// No description provided for @orderPrice.
  ///
  /// In en, this message translates to:
  /// **'Order Price'**
  String get orderPrice;

  /// No description provided for @commission.
  ///
  /// In en, this message translates to:
  /// **'Commission'**
  String get commission;

  /// No description provided for @timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timeline;

  /// No description provided for @orderAccepted.
  ///
  /// In en, this message translates to:
  /// **'Order Accepted'**
  String get orderAccepted;

  /// No description provided for @received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get received;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @deliveryProof.
  ///
  /// In en, this message translates to:
  /// **'Delivery Proof'**
  String get deliveryProof;

  /// No description provided for @mockOrderNumber2.
  ///
  /// In en, this message translates to:
  /// **'#MG-982341'**
  String get mockOrderNumber2;

  /// No description provided for @mockBakeryName.
  ///
  /// In en, this message translates to:
  /// **'Lavender French Bakery'**
  String get mockBakeryName;

  /// No description provided for @mockCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Sara Ali'**
  String get mockCustomerName;

  /// No description provided for @mockCustomerAddress.
  ///
  /// In en, this message translates to:
  /// **'Al Narjis Dist, Riyadh'**
  String get mockCustomerAddress;

  /// No description provided for @mockReviewText.
  ///
  /// In en, this message translates to:
  /// **'\"Fast and excellent service\"'**
  String get mockReviewText;

  /// No description provided for @mockNetProfit.
  ///
  /// In en, this message translates to:
  /// **'24.50'**
  String get mockNetProfit;

  /// No description provided for @mockOrderPriceVal.
  ///
  /// In en, this message translates to:
  /// **'120.00'**
  String get mockOrderPriceVal;

  /// No description provided for @mockFareVal.
  ///
  /// In en, this message translates to:
  /// **'150.00'**
  String get mockFareVal;

  /// No description provided for @mockCommissionVal.
  ///
  /// In en, this message translates to:
  /// **'50.00'**
  String get mockCommissionVal;

  /// No description provided for @mockTime1.
  ///
  /// In en, this message translates to:
  /// **'12:45 PM'**
  String get mockTime1;

  /// No description provided for @mockDesc1.
  ///
  /// In en, this message translates to:
  /// **'Al Shorfa Restaurant'**
  String get mockDesc1;

  /// No description provided for @mockTime2.
  ///
  /// In en, this message translates to:
  /// **'01:10 PM'**
  String get mockTime2;

  /// No description provided for @mockDesc2.
  ///
  /// In en, this message translates to:
  /// **'On the way to customer'**
  String get mockDesc2;

  /// No description provided for @mockTime3.
  ///
  /// In en, this message translates to:
  /// **'01:35 PM'**
  String get mockTime3;

  /// No description provided for @mockDesc3.
  ///
  /// In en, this message translates to:
  /// **'Al Yasmin Dist'**
  String get mockDesc3;
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
