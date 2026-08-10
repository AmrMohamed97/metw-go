import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_state.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          showToast(
            context,
            message: state.forgetPasswordOutModel.message ?? '',
            state: ToastStates.success,
          );
          context.pushReplacement(
            AppRoutes.otp,
            extra: ( false , context.read<ForgetPasswordCubit>().phoneController.text),
          );
        } else if (state is ForgetPasswordFailure) {
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
              key: cubit.sendOtpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 1),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.forgotPasswordTitle,
                      style: AppTextStyle.medium18(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.forgotPasswordDesc,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular16(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  50.verticalSpace,
                  FieldTitle(
                    title: AppLocalizations.of(context)!.phoneNumber,
                  ),
                  4.verticalSpace,
                  CustomTextField(
                    hintText: "+966 5X XXX XXXX",
                    controller: cubit.phoneController,
                    textInputType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.errEnterFirstPhone;
                      }
                      return null;
                    },
                  ),
                  Spacer(flex: 1),
                  Center(
                    child: CustomButton(
                      loading: state is ForgetPasswordLoading,
                      text: AppLocalizations.of(context)!.sendVerificationCode,
                      onPressed: () {
                        cubit.sendOtp();
                      },
                      isMax: true,
                    ),
                  ),
                  Spacer(flex: 2),
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
