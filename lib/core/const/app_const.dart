import 'package:intl/intl.dart';

abstract class AppConstant {
  static String currentLanguage = Intl.getCurrentLocale() == 'en_US'
      ? 'en'
      : 'ar';

  //----------------------------------------------------------------------------
  static const String accessToken = "token";
  static String userType = "usertype";
  static const String isLogin = "isLogin";
  static const String isOnboarding = "isOnboarding";
  static const String refreshToken = "refreshToken";
  static const String lang = "lang";
  static const String currentLocation = "currentLocation";
  static const String locationList = "locationList";
  static const String adressBox = "adressBox";
  static const kFontFamily = "Cairo";
  static const kFontFamily2 = "ScheherazadeNew";
  static const knotification = "notification";
  static const kTheme = "Ktheme";
  String kDeviceToken = "";
  static const String editPasswordUrl = 'update_password';

  static const String userData = "userData";

  static const String langKey = "lang";
}
