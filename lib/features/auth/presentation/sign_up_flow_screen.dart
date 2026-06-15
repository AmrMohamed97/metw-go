import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class SignUpFlowScreen extends StatefulWidget {
  const SignUpFlowScreen({super.key});

  @override
  State<SignUpFlowScreen> createState() => _SignUpFlowScreenState();
}

class _SignUpFlowScreenState extends State<SignUpFlowScreen> {
  static const _mainColor = Color(0xFFF97847);
  static const _pageBg = Color(0xFFE9E3DA);
  static const _fieldBg = Color(0xFFF7F7F7);
  static const _textBlack = Color(0xFF333333);
  static const _textGrey = Color(0xFFA4A4A4);

  final PageController _pageController = PageController();
  final int _step = 0;
  bool _settledHeader = false;

  final List<_SignupStep> _steps = const [
    _SignupStep(
      title: 'المعلومات الشخصية',
      description: 'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo',
      builder: _StepBuilder.personal,
    ),
    _SignupStep(
      title: 'معلومات المندوب',
      description: 'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo',
      builder: _StepBuilder.representative,
    ),
    _SignupStep(
      title: 'بيانات المركبة',
      description: 'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo',
      builder: _StepBuilder.vehicle,
    ),
    _SignupStep(
      title: 'مناطق الخدمة',
      description:
          'حدد المحافظات والمدن التي ستقوم بتغطيتها لضمان وصول الطلبات المناسبة إليك.',
      builder: _StepBuilder.serviceAreas,
    ),
    _SignupStep(
      title: 'رفع المستندات الرسمية',
      description: 'يرجى التأكد من وضوح الصور قبل الرفع',
      builder: _StepBuilder.documents,
    ),
    _SignupStep(
      title: 'أدخل الرمز',
      description:
          'أدخل الرمز المكون من 4 أرقام الذي أرسلناه للتو إلى\n+2010*******000',
      builder: _StepBuilder.otp,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 450), () {
      if (mounted) {
        setState(() => _settledHeader = true);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_step == _steps.length - 1) {
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutCubic,
    );
  }

  void _back() {
    if (_step == 0) {
      return;
    }
    _pageController.previousPage(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: _pageBg,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: 64.h),
              CustomButton(
                // loading: true,
                isMax: true,
                text: 'text',
                onPressed: () {},
              ),
            ],
          ),
          // SizedBox.expand(
          //   child: Stack(
          //     fit: StackFit.expand,
          //     clipBehavior: Clip.none,
          //     children: [
          //       AnimatedOpacity(
          //         opacity: _settledHeader ? 0 : 1,
          //         duration: const Duration(milliseconds: 280),
          //         child: const _HeroLogo(),
          //       ),
          //       AnimatedPositioned(
          //         duration: const Duration(milliseconds: 720),
          //         curve: Curves.easeInOutCubic,
          //         top: _settledHeader ? -87.h : 190.h,
          //         left: 0,
          //         right: 0,
          //         bottom: _settledHeader ? 0 : null,
          //         height: _settledHeader ? null : 622.h,
          //         child: const _WhitePanel(),
          //       ),
          //       AnimatedPositioned(
          //         duration: const Duration(milliseconds: 720),
          //         curve: Curves.easeInOutCubic,
          //         top: _settledHeader ? 72.h : 212.h,
          //         left: 69.w,
          //         right: 40.w,
          //         child: _ProgressBar(
          //           currentStep: _step,
          //           total: _steps.length - 1,
          //         ),
          //       ),
          //       AnimatedPositioned(
          //         duration: const Duration(milliseconds: 720),
          //         curve: Curves.easeInOutCubic,
          //         top: _settledHeader ? 94.h : 234.h,
          //         left: 16.w,
          //         right: 16.w,
          //         bottom: 14.h,
          //         child: AnimatedOpacity(
          //           opacity: _settledHeader ? 1 : 0,
          //           duration: const Duration(milliseconds: 360),
          //           child: PageView.builder(
          //             controller: _pageController,
          //             physics: const NeverScrollableScrollPhysics(),
          //             onPageChanged: (index) => setState(() => _step = index),
          //             itemCount: _steps.length,
          //             itemBuilder: (context, index) {
          //               final step = _steps[index];
          //               return _StepPage(
          //                 step: step,
          //                 index: index,
          //                 isLast: index == _steps.length - 1,
          //                 onNext: _next,
          //                 onBack: _back,
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

class _HeroLogo extends StatelessWidget {
  const _HeroLogo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.h),
      child: Align(
        alignment: Alignment.topCenter,
        child: SvgPicture.asset(
          AppImages.logo,
          width: 256.w,
          height: 130.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _WhitePanel extends StatelessWidget {
  const _WhitePanel();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, -2.h),
            blurRadius: 15.r,
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.currentStep, required this.total});

  final int currentStep;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        final isActive = index <= currentStep.clamp(0, total - 1);
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            margin: EdgeInsetsDirectional.only(
              end: index == total - 1 ? 0 : 8.w,
            ),
            height: 6.h,
            decoration: BoxDecoration(
              color: isActive
                  ? _SignUpFlowScreenState._mainColor
                  : _SignUpFlowScreenState._fieldBg,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        );
      }),
    );
  }
}

class _StepPage extends StatelessWidget {
  const _StepPage({
    required this.step,
    required this.index,
    required this.isLast,
    required this.onNext,
    required this.onBack,
  });

  final _SignupStep step;
  final int index;
  final bool isLast;
  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (index > 0)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: _IconCircleButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: onBack,
              ),
            ),
          SizedBox(height: index > 0 ? 12.h : 0),
          Text(
            step.title,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: _SignUpFlowScreenState._mainColor,
              fontSize: 16.sp,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            step.description,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: _SignUpFlowScreenState._textGrey,
              fontSize: 14.sp,
              height: 1.45,
            ),
          ),
          SizedBox(height: 28.h),
          _StepContent(builder: step.builder),
          SizedBox(height: 34.h),
          if (step.builder == _StepBuilder.otp)
            _PrimaryAction(text: 'تأكيد', onPressed: onNext)
          else
            Row(
              children: [
                SizedBox(
                  width: isLast ? 170.w : 118.w,
                  child: _PrimaryAction(
                    text: isLast ? 'انشاء الحساب' : 'التالي',
                    onPressed: onNext,
                    pillEnd: true,
                  ),
                ),
                if (!isLast) ...[
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      height: 56.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _SignUpFlowScreenState._fieldBg,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            height: 2.5,
                            color: _SignUpFlowScreenState._textBlack,
                          ),
                          children: const [
                            TextSpan(text: 'لديك حساب بالفعل؟ '),
                            TextSpan(
                              text: 'تسجيل الدخول',
                              style: TextStyle(
                                color: _SignUpFlowScreenState._mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class _StepContent extends StatelessWidget {
  const _StepContent({required this.builder});

  final _StepBuilder builder;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 360),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final offset = Tween<Offset>(
          begin: const Offset(-0.08, 0),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offset, child: child),
        );
      },
      child: switch (builder) {
        _StepBuilder.personal => const _PersonalInfoStep(),
        _StepBuilder.representative => const _RepresentativeStep(),
        _StepBuilder.vehicle => const _VehicleStep(),
        _StepBuilder.serviceAreas => const _ServiceAreasStep(),
        _StepBuilder.documents => const _DocumentsStep(),
        _StepBuilder.otp => const _OtpStep(),
      },
    );
  }
}

class _PersonalInfoStep extends StatelessWidget {
  const _PersonalInfoStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('personal'),
      children: [
        Row(
          children: [
            const Expanded(
              child: _LabeledField(label: 'الاسم الاول', hint: 'مثال: احمد'),
            ),
            SizedBox(width: 16.w),
            const Expanded(
              child: _LabeledField(label: 'الاسم الاخير', hint: 'مثال: محمد'),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const _LabeledField(label: 'رقم الهاتف', hint: '+02 010X XXX XXXX'),
        SizedBox(height: 16.h),
        const _LabeledField(label: 'رقم هاتف اخر', hint: '+02 010X XXX XXXX'),
        SizedBox(height: 16.h),
        const _LabeledField(
          label: 'البريد الالكتروني',
          hint: 'captain@metwgo.com',
        ),
        SizedBox(height: 16.h),
        const _LabeledField(label: 'تاريخ الميلاد', hint: 'mm/dd/yyyy'),
        SizedBox(height: 16.h),
        const _GenderSelector(),
        SizedBox(height: 16.h),
        const _LabeledField(
          label: 'العنوان بالتفصيل',
          subLabel: 'المدينة / الحي / الشارع',
          hint: 'أدخل تفاصيل عنوانك هنا ليتمكن النظام من تحديد نطاق عملك',
          minLines: 2,
        ),
        SizedBox(height: 16.h),
        const _LabeledField(
          label: 'كلمة المرور',
          hint: '...............',
          icon: Icons.lock_open_rounded,
          obscure: true,
        ),
        SizedBox(height: 16.h),
        const _LabeledField(
          label: 'تأكيد كلمة المرور',
          hint: '...............',
          icon: Icons.lock_rounded,
          obscure: true,
        ),
      ],
    );
  }
}

class _RepresentativeStep extends StatelessWidget {
  const _RepresentativeStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('representative'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionLabel('نوع المندوب'),
        SizedBox(height: 12.h),
        Row(
          children: [
            const Expanded(
              child: _ChoiceTile(text: 'مندوب مستقل', selected: true),
            ),
            SizedBox(width: 16.w),
            const Expanded(child: _ChoiceTile(text: 'مندوب مستودع')),
          ],
        ),
        SizedBox(height: 22.h),
        const _LabeledField(label: 'رقم المستودع', hint: 'اختر رقم المستودع'),
        SizedBox(height: 24.h),
        const _SectionLabel('تصنيف العمل'),
        SizedBox(height: 4.h),
        const _HintText('يمكنك اختيار أكثر من تصنيف حسب نطاق عملك.'),
        SizedBox(height: 14.h),
        const _WorkCategory(
          title: 'مندوب توصيل',
          subtitle: 'مندوب توصيل بداخل محافظة',
          selected: true,
        ),
        SizedBox(height: 12.h),
        const _WorkCategory(
          title: 'مندوب شحن',
          subtitle: 'مندوب شحن بين محافظات',
        ),
        SizedBox(height: 12.h),
        const _WorkCategory(
          title: 'سائق باص',
          subtitle: 'نقل ركاب وبضائع خفيفة',
        ),
        SizedBox(height: 22.h),
        const _TipCard(
          title: 'فرص أرباح أعلى!',
          text: 'تفعيل خيارات الشحن بين المدن يزيد من دخلك بنسبة 40%',
        ),
      ],
    );
  }
}

class _VehicleStep extends StatelessWidget {
  const _VehicleStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('vehicle'),
      children: [
        const _LabeledField(label: 'وسيلة النقل', hint: 'اختر وسيلة النقل'),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(
              child: _LabeledField(label: 'اقصى وزن', hint: '20 كجم'),
            ),
            SizedBox(width: 16.w),
            const Expanded(
              child: _LabeledField(label: 'اقصى حجم', hint: '0.05 م.م'),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const _LabeledField(label: 'رقم اللوحة', hint: 'أ ب ج - 1 2 3'),
        SizedBox(height: 8.h),
        const _HintText('يرجى كتابة الحروف والأرقام كما تظهر في رخصة المركبة'),
        SizedBox(height: 28.h),
        const _UploadBox(
          title: 'تحميل صورة المركبة',
          subtitle: 'JPG, PNG بحد أقصى 5 ميجا بايت',
        ),
        SizedBox(height: 20.h),
        const _TipCard(
          text:
              'تأكد من إدخال البيانات بدقة، حيث سيتم مطابقتها مع المستندات الرسمية التي ستقوم برفعها في الخطوة القادمة.',
        ),
      ],
    );
  }
}

class _ServiceAreasStep extends StatelessWidget {
  const _ServiceAreasStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('serviceAreas'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _LabeledField(label: 'اختر المحافظات', hint: 'المحافظات'),
        SizedBox(height: 12.h),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.end,
          children: [
            _ChipPill(text: 'القاهرة', selected: true),
            _ChipPill(text: 'الجيزة', selected: true),
          ],
        ),
        SizedBox(height: 18.h),
        const _LabeledField(label: 'المدن', hint: 'المدن'),
        SizedBox(height: 12.h),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.end,
          children: [
            _ChipPill(text: 'مدينة نصر', selected: true),
            _ChipPill(text: 'مصر الجديدة', selected: true),
          ],
        ),
        SizedBox(height: 22.h),
        const _VillageToggle(),
        SizedBox(height: 22.h),
        const _TipCard(
          text:
              'تفعيل خدمة القرى قد يزيد من عدد الطلبات المتاحة لك بنسبة 25٪، ولكن تأكد من توفر وسيلة النقل المناسبة للطرق الوعرة.',
        ),
      ],
    );
  }
}

class _DocumentsStep extends StatelessWidget {
  const _DocumentsStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('documents'),
      children: [
        const _AvatarUpload(),
        SizedBox(height: 28.h),
        const _DocumentRow(title: 'الهوية الوطنية'),
        SizedBox(height: 20.h),
        const _DocumentRow(title: 'رخصة القيادة'),
        SizedBox(height: 20.h),
        const _DocumentRow(title: 'رخصة العربية'),
      ],
    );
  }
}

class _OtpStep extends StatelessWidget {
  const _OtpStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('otp'),
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => _OtpDigit(value: index < 3 ? '2' : ''),
          ),
        ),
        SizedBox(height: 48.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: _SignUpFlowScreenState._fieldBg,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Text(
            '00:20',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _SignUpFlowScreenState._textBlack,
              fontSize: 13.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'أرسل الرمز مرة أخرى',
          style: TextStyle(
            color: _SignUpFlowScreenState._mainColor,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 28.h),
      ],
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.hint,
    this.subLabel,
    this.icon,
    this.minLines = 1,
    this.obscure = false,
  });

  final String label;
  final String hint;
  final String? subLabel;
  final IconData? icon;
  final int minLines;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _SectionLabel(label)),
            if (subLabel != null) _HintText(subLabel!),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          constraints: BoxConstraints(minHeight: minLines > 1 ? 68.h : 54.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: _SignUpFlowScreenState._fieldBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  obscure ? '...............' : hint,
                  maxLines: minLines,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textGrey,
                    fontSize: obscure ? 24.sp : 12.sp,
                    height: obscure ? 1 : 1.45,
                  ),
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 12.w),
                Icon(
                  icon,
                  color: _SignUpFlowScreenState._textBlack,
                  size: 22.sp,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionLabel('الجنس'),
        SizedBox(height: 8.h),
        Row(
          children: [
            const Expanded(
              child: _ChoiceTile(
                text: 'ذكر',
                selected: true,
                icon: Icons.male_rounded,
              ),
            ),
            SizedBox(width: 16.w),
            const Expanded(
              child: _ChoiceTile(text: 'انثى', icon: Icons.female_rounded),
            ),
          ],
        ),
      ],
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({required this.text, this.selected = false, this.icon});

  final String text;
  final bool selected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? _SignUpFlowScreenState._mainColor
        : _SignUpFlowScreenState._textBlack;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 54.h,
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFFFFAF5)
            : _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: selected
              ? _SignUpFlowScreenState._mainColor
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: color, fontSize: 14.sp),
          ),
          if (icon != null) ...[
            SizedBox(width: 8.w),
            Icon(icon, color: color, size: 18.sp),
          ],
        ],
      ),
    );
  }
}

class _WorkCategory extends StatelessWidget {
  const _WorkCategory({
    required this.title,
    required this.subtitle,
    this.selected = false,
  });

  final String title;
  final String subtitle;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFFFFAF5)
            : _SignUpFlowScreenState._fieldBg,
        border: Border.all(
          color: selected
              ? _SignUpFlowScreenState._mainColor
              : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(
            selected
                ? Icons.check_circle_rounded
                : Icons.radio_button_unchecked,
            color: selected
                ? _SignUpFlowScreenState._mainColor
                : _SignUpFlowScreenState._textGrey,
            size: 22.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textBlack,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textGrey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  const _UploadBox({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_upload_outlined,
            color: _SignUpFlowScreenState._mainColor,
            size: 30.sp,
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(
              color: _SignUpFlowScreenState._textBlack,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            subtitle,
            style: TextStyle(
              color: _SignUpFlowScreenState._textGrey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({this.title, required this.text});

  final String? title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: _SignUpFlowScreenState._mainColor,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: TextStyle(
                      color: _SignUpFlowScreenState._mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],
                Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textBlack,
                    fontSize: 13.sp,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VillageToggle extends StatelessWidget {
  const _VillageToggle();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Switch(
            value: true,
            activeThumbColor: _SignUpFlowScreenState._mainColor,
            onChanged: (_) {},
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'تفعيل خدمة القرى',
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textBlack,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'العمل في المناطق الريفية المحيطة',
                  style: TextStyle(
                    color: _SignUpFlowScreenState._textGrey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarUpload extends StatelessWidget {
  const _AvatarUpload();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _SectionLabel('الصورة الشخصية'),
        SizedBox(height: 14.h),
        Center(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CircleAvatar(
                radius: 52.r,
                backgroundColor: _SignUpFlowScreenState._fieldBg,
                child: Icon(
                  Icons.person_rounded,
                  size: 54.sp,
                  color: _SignUpFlowScreenState._textGrey,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: _SignUpFlowScreenState._mainColor,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Text(
                  'تعديل الصورة',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _SectionLabel(title),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Expanded(child: _MiniUpload(text: 'الوجه الأمامي')),
            SizedBox(width: 16.w),
            const Expanded(child: _MiniUpload(text: 'الوجه الخلفي')),
          ],
        ),
      ],
    );
  }
}

class _MiniUpload extends StatelessWidget {
  const _MiniUpload({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            color: _SignUpFlowScreenState._mainColor,
            size: 22.sp,
          ),
          SizedBox(height: 7.h),
          Text(
            text,
            style: TextStyle(
              color: _SignUpFlowScreenState._textBlack,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpDigit extends StatelessWidget {
  const _OtpDigit({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: _SignUpFlowScreenState._textBlack,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _PrimaryAction extends StatelessWidget {
  const _PrimaryAction({
    required this.text,
    required this.onPressed,
    this.pillEnd = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool pillEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _SignUpFlowScreenState._mainColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12.r),
              bottomStart: Radius.circular(12.r),
              topEnd: Radius.circular(12.r),
              bottomEnd: Radius.circular(pillEnd ? 36.r : 12.r),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _IconCircleButton extends StatelessWidget {
  const _IconCircleButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 40.w,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 18.sp),
        color: _SignUpFlowScreenState._textBlack,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class _ChipPill extends StatelessWidget {
  const _ChipPill({required this.text, this.selected = false});

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFFFFAF5)
            : _SignUpFlowScreenState._fieldBg,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: selected
              ? _SignUpFlowScreenState._mainColor
              : Colors.transparent,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected
              ? _SignUpFlowScreenState._mainColor
              : _SignUpFlowScreenState._textBlack,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: _SignUpFlowScreenState._textBlack,
        fontSize: 14.sp,
        height: 1.2,
      ),
    );
  }
}

class _HintText extends StatelessWidget {
  const _HintText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: _SignUpFlowScreenState._textGrey,
        fontSize: 12.sp,
        height: 1.45,
      ),
    );
  }
}

class _SignupStep {
  const _SignupStep({
    required this.title,
    required this.description,
    required this.builder,
  });

  final String title;
  final String description;
  final _StepBuilder builder;
}

enum _StepBuilder {
  personal,
  representative,
  vehicle,
  serviceAreas,
  documents,
  otp,
}
