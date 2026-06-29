import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/validitions.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_state.dart';
import 'package:metw_go/features/personal_info/presentation/widgets/personal_info_gender_selector.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        final cubit = context.read<PersonalInfoCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'البيانات الشخصية'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: cubit.firstViewFormKey,
              child: SingleChildScrollView(
                child: AnimatedColumn(
                  revealOnScroll: true,
                  children: [
                    // 16.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.personalInfo,
                      style: AppTextStyle.medium16(
                        context,
                      ).copyWith(color: Theme.of(context).primaryColor),
                    ),
                    3.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.startCreatingProfile,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    24.verticalSpace,
                    Row(
                      spacing: 14,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              FieldTitle(
                                title: AppLocalizations.of(context)!.firstName,
                              ),
                              4.verticalSpace,
                              CustomTextField(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.exampleAhmed,
                                controller: cubit.firstNameController,
                                validator: (val) =>
                                    firstNameValidator(context, val),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              FieldTitle(
                                title: AppLocalizations.of(context)!.lastName,
                              ),
                              4.verticalSpace,
                              CustomTextField(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.exampleMohamed,
                                controller: cubit.lastNameController,
                                validator: (val) =>
                                    lastNameValidator(context, val),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // 16.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.phoneNumber,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '+02 010X XXX XXXX',
                      controller: cubit.firstPhoneController,
                      validator: (val) => firstPhoneValidator(context, val),
                    ),
                    // 16.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.anotherPhoneNumber,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '+02 010X XXX XXXX',
                      controller: cubit.secondPhoneController,
                      validator: (val) => secondPhoneValidator(context, val),
                    ),
                    // 16.verticalSpace,
                    FieldTitle(title: AppLocalizations.of(context)!.email),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: 'captain@metwgo.com',
                      controller: cubit.emailController,
                      validator: (val) => emailValidator(context, val),
                    ),
                    // 16.verticalSpace,
                    FieldTitle(title: AppLocalizations.of(context)!.birthDate),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: 'mm/dd/yyyy',
                      controller: cubit.boarnDateController,
                      validator: (val) => boarnDateValidator(context, val),
                    ),
                    // 16.verticalSpace,
                    PersonalInfoGenderSelector(),
                    16.verticalSpace,
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        FieldTitle(
                          title: AppLocalizations.of(context)!.detailedAddress,
                        ),
                        Row(
                          children: [
                            Image.asset(AppImages.locationIcon),
                            4.horizontalSpace,
                            FieldTitle(
                              title: AppLocalizations.of(
                                context,
                              )!.cityNeighborhoodStreet,
                            ),
                          ],
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      minLine: 2,
                      hintText: AppLocalizations.of(context)!.addressHintText,
                      controller: cubit.addressController,
                      validator: (val) => addressValidator(context, val),
                    ),
                    16.verticalSpace,
                    FieldTitle(title: 'كلمة المرور الحالية'),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '...............',
                      controller: cubit.currentPasswordController,
                      validator: (val) => passwordValidator(context, val),
                      obscureText: cubit.currentObscurePassword,
                      suffixIcon: GestureDetector(
                        onTap: () => cubit.changecurrentObscurePassword(),
                        child: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Image.asset(
                            cubit.obscurePassword
                                ? AppImages.lockClosed
                                : AppImages.lockOpened,
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    FieldTitle(title: 'كلمة المرور الجديدة'),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '...............',
                      controller: cubit.passwordController,
                      validator: (val) => passwordValidator(context, val),
                      obscureText: cubit.obscurePassword,
                      suffixIcon: GestureDetector(
                        onTap: () => cubit.changeObscurePassword(),
                        child: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Image.asset(
                            cubit.obscurePassword
                                ? AppImages.lockClosed
                                : AppImages.lockOpened,
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                    ),
                    // 16.verticalSpace,
                    FieldTitle(
                      title:'كلمة المرور الجديدة',
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '...............',
                      controller: cubit.confirmPasswordController,
                      validator: (val) =>
                          confirmPasswordValidator(context, val),
                      obscureText: cubit.obscureConfirmPassword,
                      suffixIcon: GestureDetector(
                        onTap: () => cubit.changeConfirmObscurePassword(),
                        child: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Image.asset(
                            cubit.obscureConfirmPassword
                                ? AppImages.lockClosed
                                : AppImages.lockOpened,
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                    ),
                    18.verticalSpace,
                    CustomButton(
                      isMax: true,
                      text: 'حفظ',
                      onPressed: () {
                        // cubit.firstViewPress();
                      },
                    ),
                    20.verticalSpace,
                    ViewInsetsSpace(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
