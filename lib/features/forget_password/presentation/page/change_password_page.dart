import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children:
              [
                    Spacer(flex: 1),
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
                    FieldTitle(title: AppLocalizations.of(context)!.password),
                    4.verticalSpace,
                    CustomTextField(hintText: "..............."),
                    FieldTitle(
                      title: AppLocalizations.of(context)!.confirmPassword,
                    ),
                    4.verticalSpace,
                    CustomTextField(hintText: "..............."),
                    Spacer(flex: 1),
                    CustomButton(
                      text: AppLocalizations.of(context)!.save,
                      onPressed: () {
                        context.pushReplacement(AppRoutes.otp);
                      },
                      isMax: true,
                    ),
                    Spacer(flex: 2),
                    // ViewInsetsSpace(),
                  ]
                  .animate(interval: 50.ms)
                  .fade(duration: 500.ms)
                  .slideY(begin: 0.05, end: 0),
        ),
      ),
    );
  }
}
