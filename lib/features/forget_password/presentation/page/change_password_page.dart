import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_state.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          showToast(
            context,
            message: state.changePasswordOutModel.message ?? '',
            state: ToastStates.success,
          );
          context.go(AppRoutes.login);
        } else if (state is ChangePasswordFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgetPasswordCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: cubit.changePasswordFormKey,
              child: Column(
                crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children:
                  [
                        Spacer(flex: 2),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.changePassword,
                            style: AppTextStyle.medium18(context).copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 22.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.changePasswordDesc,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.regular16(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        50.verticalSpace,
                        FieldTitle(
                          title: AppLocalizations.of(context)!.password,
                        ),
                        4.verticalSpace,
                        CustomTextField(
                          hintText: "...............",
                          controller: cubit.passwordController,
                          obscureText: cubit.obscurePassword,
                          suffixIcon: GestureDetector(
                            onTap: () => cubit.toggleObscurePassword(),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.errEnterPassword;
                            }
                            return null;
                          },
                        ),
                        FieldTitle(
                          title: AppLocalizations.of(context)!.confirmPassword,
                        ),
                        4.verticalSpace,
                        CustomTextField(
                          hintText: "...............",
                          controller: cubit.confirmPasswordController,
                          obscureText: cubit.confirmObscurePassword,
                          suffixIcon: GestureDetector(
                            onTap: () => cubit.toggleConfirmObscurePassword(),
                            child: Padding(
                              padding: EdgeInsets.all(12.r),
                              child: Image.asset(
                                cubit.confirmObscurePassword
                                    ? AppImages.lockClosed
                                    : AppImages.lockOpened,
                                width: 20.r,
                                height: 20.r,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.errEnterConfirmPassword;
                            }
                            return null;
                          },
                        ),
                        Spacer(flex: 1),
                        Center(
                          child: CustomButton(
                            loading: state is ChangePasswordLoading,
                            text: AppLocalizations.of(context)!.save,
                            onPressed: () {
                              cubit.changePassword();
                            },
                            isMax: true,
                          ),
                        ),
                        Spacer(flex: 4),
                        // ViewInsetsSpace(),
                      ]
                      .animate(interval: 50.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: 0.05, end: 0),
              ),
            ),
          ),
        );
      },
    );
  }
}
