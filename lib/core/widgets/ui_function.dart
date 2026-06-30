import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

// import 'package:motion_toast/motion_toast.dart';

import '../theme/app_text_style.dart';
import '../theme/my_colors.dart';

class UiHelper {
  // static void showSnakeBar({
  //   required String message,
  //   required BuildContext context,
  //   required MotionToastType type,
  // }) {
  //   // Custom colors matching the app theme
  //   final primaryColor = MyColors.primaryColor;
  //   final successColor = MyColors.green;
  //   final errorColor = MyColors.red;
  //   final warningColor =Colors.yellow;
  //   final infoColor = Theme.of(context).colorScheme.surface;

  //   switch (type) {
  //     case MotionToastType.success:
  //       _showCustomToast(
  //         context: context,
  //         message: message,
  //         primaryColor: successColor,
  //         icon: Icons.check_circle_outline,
  //       );
  //       break;
  //     case MotionToastType.error:
  //       _showCustomToast(
  //         context: context,
  //         message: message,
  //         primaryColor: errorColor,
  //         icon: Icons.error_outline,
  //       );
  //       break;
  //     case MotionToastType.warning:
  //       _showCustomToast(
  //         context: context,
  //         message: message,
  //         primaryColor: warningColor,
  //         icon: Icons.warning_amber_outlined,
  //       );
  //       break;
  //     case MotionToastType.info:
  //       _showCustomToast(
  //         context: context,
  //         message: message,
  //         primaryColor: infoColor,
  //         icon: Icons.info_outline,
  //       );
  //       break;
  //     case MotionToastType.custom:
  //       _showCustomToast(
  //         context: context,
  //         message: message,
  //         primaryColor: primaryColor,
  //         icon: Icons.notifications_outlined,
  //       );
  //       break;
  //   }
  // }

  // static void _showCustomToast({
  //   required BuildContext context,
  //   required String message,
  //   required Color primaryColor,
  //   required IconData icon,
  // }) {
  //   MotionToast(
  //     icon: icon,
  //     primaryColor: primaryColor,
  //     secondaryColor: Colors.white,
  //     toastDuration: const Duration(seconds: 3),
  //     width: 350,
  //     height: 80,
  //     borderRadius: 16,
  //     toastAlignment: Alignment.topCenter, // Position at top center
  //     description: Text(
  //       message,
  //       textAlign: TextAlign.right, // RTL text alignment
  //       style: AppTextStyle.medium16(
  //         context,
  //       ).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
  //     ),
  //   ).show(context);
  // }

  static BoxShadow shadow(BuildContext context) {
    return BoxShadow(
      color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.3),
      spreadRadius: -2,
      blurRadius: 15,
      offset: const Offset(0, 4),
    );
  }

  // Glass effect shadow for premium look
  static BoxShadow glassShadow(BuildContext context) {
    return BoxShadow(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
      spreadRadius: 0,
      blurRadius: 20,
      offset: const Offset(0, 8),
    );
  }

  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        backgroundColor: const Color(0xFF1C1C24),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: MyColors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.logout_rounded,
                  color: MyColors.red,
                  size: 32.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text('تأكيد تسجيل الخروج', style: AppTextStyle.bold18(context)),
              SizedBox(height: 12.h),
              Text(
                'هل أنت متأكد من رغبتك في تسجيل الخروج من النظام؟',
                textAlign: TextAlign.center,
                style: AppTextStyle.medium14(context).copyWith(
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'إلغاء',
                      onPressed: () => Navigator.pop(context),
                      backgroundColor: Colors.white.withValues(alpha: 0.1),
                      textColor: Colors.white,
                      fixedSize: false,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      text: 'خروج',
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AppCubit>().logout();
                      },
                      backgroundColor: MyColors.red,
                      fixedSize: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
