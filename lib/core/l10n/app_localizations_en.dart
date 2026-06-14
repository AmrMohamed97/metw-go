// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get getStarted => 'Get Started';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get shareSuccess => 'App Shared Successfully Thanks For Your Feedback';

  @override
  String get shareAppMessage =>
      'Share App \n Google Play Store: https://play.google.com/store/apps \n Apple AppStore: https://apps.apple.com/us/app ';
}
