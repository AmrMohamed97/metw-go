// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get male => 'ذكر';

  @override
  String get female => 'انثى';

  @override
  String get gender => 'الجنس';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get startCreatingProfile =>
      'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo';

  @override
  String get firstName => 'الاسم الاول';

  @override
  String get exampleAhmed => 'مثال: احمد';

  @override
  String get lastName => 'الاسم الاخير';

  @override
  String get exampleMohamed => 'مثال: محمد';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get anotherPhoneNumber => 'رقم الهاتف اخر';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get detailedAddress => ' العنوان بالتفصيل';

  @override
  String get cityNeighborhoodStreet => 'المدينة / الحي / الشارع';

  @override
  String get addressHintText =>
      'أدخل تفاصيل عنوانك هنا ليتمكن النظام من \nتحديد نطاق عملك';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get alreadyHaveAccount => 'لديك حساب الفعل؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get next => 'التالى';
}
