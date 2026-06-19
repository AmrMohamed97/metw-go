import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/otp/presentation/widgets/otp_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(flex: 1),
            Text(
              "أدخل الرمز",
              style: AppTextStyle.medium18(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            8.verticalSpace,
            Text(
              "أدخل الرمز المكون من 4 أرقام الذي أرسلناه للتو إلى\n000*******2010+",
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: MyColors.greyFill,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                "00:20",
                style: AppTextStyle.medium16(
                  context,
                ).copyWith(color: MyColors.secondaryColor),
              ),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {},
              child: Text(
                "أرسل الرمز مرة أخرى",
                style: AppTextStyle.medium14(context).copyWith(
                  color: MyColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: MyColors.primaryColor,
                ),
              ),
            ),
            // const Spacer(),
            18.verticalSpace,
            CustomButton(
              text: "تأكيد",
              onPressed: () {
                // context.go(AppRoutes.login);
                context.go(AppRoutes.changePasswordPage);
              },
              isMax: true,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
