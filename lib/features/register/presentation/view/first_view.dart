import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_app_bar.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return CustomScrollView(
          slivers: [
            FirstViewAppBar(),
            FirstViewBody(
              body: AnimatedColumn(
                revealOnScroll: true,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16.0,
                      end: 60,
                    ),
                    child: CustomSteper(),
                  ),
                  16.verticalSpace,
                  Text(
                    'المعلومات الشخصية',
                    style: AppTextStyle.medium16(
                      context,
                    ).copyWith(color: Theme.of(context).primaryColor),
                  ),
                  3.verticalSpace,
                  Text(
                    'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo',
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  24.verticalSpace,
                  Row(
                    spacing: 14,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            FieldTitle(title: 'الاسم الاول'),
                            4.verticalSpace,
                            CustomTextField(
                              hintText: 'مثال: احمد',
                              controller: cubit.firstNameController,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            FieldTitle(title: 'الاسم الاخير'),
                            4.verticalSpace,
                            CustomTextField(
                              hintText: 'مثال: محمد',
                              controller: cubit.lastNameController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'رقم الهاتف'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: '+02 010X XXX XXXX',
                    controller: cubit.firstPhoneController,
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'رقم الهاتف اخر'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: '+02 010X XXX XXXX',
                    controller: cubit.secondPhoneController,
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'البريد الالكتروني'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: 'captain@metwgo.com',
                    controller: cubit.emailController,
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'تاريخ الميلاد'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: 'mm/dd/yyyy',
                    controller: cubit.boarnDateController,
                  ),
                  16.verticalSpace,
                  _GenderSelector(),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      FieldTitle(title: ' العنوان بالتفصيل'),
                      Row(
                        children: [
                          Image.asset(AppImages.locationIcon),
                          4.horizontalSpace,
                          FieldTitle(title: 'المدينة / الحي / الشارع'),
                        ],
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  CustomTextField(
                    minLine: 2,
                    hintText:
                        'أدخل تفاصيل عنوانك هنا ليتمكن النظام من \nتحديد نطاق عملك',
                    controller: cubit.boarnDateController,
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'كلمة المرور'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: '...............',
                    controller: cubit.passwordController,
                  ),
                  16.verticalSpace,
                  FieldTitle(title: 'تأكيد كلمة المرور'),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: '...............',
                    controller: cubit.confirmPasswordController,
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Text(
                                'لديك حساب الفعل؟',
                                style: AppTextStyle.regular14(context).copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                'تسجيل الدخول',
                                style: AppTextStyle.regular14(context).copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: CustomButton(text: 'التالى', onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.regular14(
        context,
      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FieldTitle(title: 'الجنس'),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => cubit.changeGender(true),
                    child: _ChoiceTile(
                      text: 'ذكر',
                      isSelected: cubit.isMale,
                      icon: Icons.male_rounded,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () => cubit.changeGender(false),
                    child: _ChoiceTile(
                      text: 'انثى',
                      icon: Icons.female_rounded,
                      isSelected: !cubit.isMale,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({required this.text, this.isSelected = false, this.icon});

  final String text;
  final bool isSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 46,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFFFAF5)
            : Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
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
