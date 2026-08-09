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
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_cubit.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_state.dart';
import 'package:metw_go/features/otp/presentation/widgets/otp_fields.dart';
import 'package:metw_go/features/otp/presentation/widgets/otp_timer.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.fromLogin = false, this.phone = ''});
  final bool fromLogin;
  final String phone;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccessState) {
          showToast(context, message: state.verifyOtpOutModel.message ?? '', state: ToastStates.success);
          widget.fromLogin
              ? context.pushReplacement(AppRoutes.changePasswordPage)
              : context.pushReplacement(AppRoutes.commingSoonPage);
        } else if (state is VerifyOtpErrorState) {
          showToast(context, message: state.error, state: ToastStates.error);
        } else if (state is ResendOtpSuccessState) {
          showToast(context, message: state.resendOtpOutModel.message ?? '', state: ToastStates.success);
        } else if (state is ResendOtpErrorState) {
          showToast(context, message: state.error, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<OtpCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(
            popPress: widget.fromLogin ? null : () => context.go(AppRoutes.login),
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              AppLocalizations.of(context)!.enterCode,
              style: AppTextStyle.medium18(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            8.verticalSpace,
            Text(
              AppLocalizations.of(context)!.enterCodeDesc,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular16(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 48.h),
            Directionality(
              textDirection: TextDirection.ltr,
              child: OtpFields(
                onCompleted: (value) {
                  _otpCode = value;
                },
              ),
            ),
            SizedBox(height: 48.h),
            OtpTimer(
              onResend: () {
                cubit.resendOtp(widget.phone);
              },
            ),
            // const Spacer(),
            Spacer(),
            CustomButton(
              loading: state is VerifyOtpLoadingState,
              text: AppLocalizations.of(context)!.confirm,
              onPressed: () {
                if (_otpCode.length == 4) {
                  cubit.verifyOtp(widget.phone, _otpCode);
                } else {
                  showToast(context, message: 'Please enter a valid OTP', state: ToastStates.error);
                }
              },
              isMax: true,
            ),
            Spacer(flex: 4),
          ].animate(interval: 100.ms)
           .fade(duration: 700.ms, curve: Curves.easeOut)
           .slideY(begin: 0.2, end: 0, duration: 700.ms, curve: Curves.easeOutCubic)
           .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1), duration: 700.ms, curve: Curves.easeOutCubic),
        ),
      ),
    );
      },
    );
  }
}
