// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get getStarted => 'ابدأ رحلتك';

  @override
  String get signInWithGoogle => 'تسجيل الدخول بواسطة جوجل';

  @override
  String get shareSuccess => 'تم مشاركة التطبيق بنجاح';

  @override
  String get shareAppMessage =>
      'مشاركه التطبيق  \n Google Play Store: https://play.google.com/store/apps \n Apple AppStore: https://apps.apple.com/us/app ';
}
