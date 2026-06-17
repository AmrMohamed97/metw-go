import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/validitions.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_app_bar.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';
import 'package:metw_go/features/register/presentation/widgets/gender_selecor.dart';

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
              body: Form(
                key: cubit.firstViewFormKey,
                child: AnimatedColumn(
                  revealOnScroll: true,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        end: 60,
                      ),
                      child: CustomSteper(),
                    ),
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
                    GenderSelector(),
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
                      controller: cubit.boarnDateController,
                      validator: (val) => addressValidator(context, val),
                    ),
                    16.verticalSpace,
                    FieldTitle(title: AppLocalizations.of(context)!.password),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '...............',
                      controller: cubit.passwordController,
                      validator: (val) => passwordValidator(context, val),
                    ),
                    // 16.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.confirmPassword,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: '...............',
                      controller: cubit.confirmPasswordController,
                      validator: (val) =>
                          confirmPasswordValidator(context, val),
                    ),
                    34.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 46.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.alreadyHaveAccount,
                                  style: AppTextStyle.regular14(context)
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.tertiary,
                                      ),
                                ),
                                4.horizontalSpace,
                                Text(
                                  AppLocalizations.of(context)!.login,
                                  style: AppTextStyle.regular14(context)
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            text: AppLocalizations.of(context)!.next,
                            onPressed: () => cubit.firstViewPress(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
