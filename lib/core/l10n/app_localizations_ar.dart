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

  @override
  String get errEnterFirstName => 'الرجاء إدخال الاسم الأول';

  @override
  String get errEnterLastName => 'الرجاء إدخال الاسم الأخير';

  @override
  String get errEnterFirstPhone => 'الرجاء إدخال رقم الهاتف الأول';

  @override
  String get errEnterSecondPhone => 'الرجاء إدخال رقم الهاتف الثاني';

  @override
  String get errEnterEmail => 'الرجاء إدخال البريد الإلكتروني';

  @override
  String get errEnterBirthDate => 'الرجاء إدخال تاريخ الميلاد';

  @override
  String get errEnterPassword => 'الرجاء إدخال كلمة المرور';

  @override
  String get errEnterConfirmPassword => 'الرجاء إدخال تأكيد كلمة المرور';

  @override
  String get errEnterAddress => 'الرجاء إدخال العنوان';

  @override
  String get delegateInfo => 'معلومات المندوب';

  @override
  String get delegateType => 'نوع المندوب';

  @override
  String get warehouseDelegate => 'مندوب مستودع';

  @override
  String get independentDelegate => 'مندوب مستقل';

  @override
  String get warehouseNumber => 'رقم المستودع';

  @override
  String get chooseWarehouseNumber => 'اختر رقم المستودع';

  @override
  String get workClassification => 'تصنيف العمل';

  @override
  String get chooseMultipleClassifications =>
      'يمكنك اختيار أكثر من تصنيف حسب نطاق عملك.';

  @override
  String get deliveryDelegate => 'مندوب توصيل';

  @override
  String get deliveryDelegateSubtitle => 'مندوب توصيل بداخل محافظة';

  @override
  String get shippingDelegate => 'مندوب شحن';

  @override
  String get shippingDelegateSubtitle => 'مندوب شحن بين محافظات';

  @override
  String get busDriver => 'سائق باص';

  @override
  String get busDriverSubtitle => 'نقل ركاب وبضائع خفيفة';

  @override
  String get higherProfitOpp => 'فرص أرباح أعلى!';

  @override
  String get intercityShippingIncreasesIncome =>
      'تفعيل خيارات الشحن بين المدن يزيد من دخلك بنسبة 40%';

  @override
  String get errChooseWarehouse => 'الرجاء اختيار رقم المستودع';

  @override
  String get errChooseWorkClassification =>
      'الرجاء اختيار تصنيف عمل واحد على الأقل';
}
