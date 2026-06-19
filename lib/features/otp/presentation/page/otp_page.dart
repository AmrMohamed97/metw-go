import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/otp/presentation/widgets/otp_fields.dart';
import 'package:metw_go/features/otp/presentation/widgets/otp_timer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, this.fromLogin = false});
  final bool fromLogin;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(),
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
                  // context.read<OtpCubit>().verifyOtp(
                  //   VerifyOtpRequest(
                  //     otp: value,
                  //     userId: userId,
                  //   ),
                  // );
                  // context.push(widget.nextPage, extra: true);
                },
              ),
            ),
            SizedBox(height: 48.h),
            const OtpTimer(),
            // const Spacer(),
            Spacer(),
            CustomButton(
              text: AppLocalizations.of(context)!.confirm,
              onPressed: () {
                fromLogin
                    ? context.go(AppRoutes.changePasswordPage)
                    : context.go(AppRoutes.login);
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
  }
}
