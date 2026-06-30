import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
    this.onBackPressed,
    this.title,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.padding,
    this.spacing,
    this.showIcon = true,
    this.compact = false,
  });

  /// The error message to display
  final String errorMessage;

  /// Callback for retry/reload action
  final void Function()? onPressed;

  /// Callback for back action
  final void Function()? onBackPressed;

  /// Custom title text (defaults to 'حدث خطأ ما!')
  final String? title;

  /// Custom icon widget (defaults to error icon)
  final Widget? icon;

  /// Custom icon color
  final Color? iconColor;

  /// Custom background color for the container
  final Color? backgroundColor;

  /// Custom padding around the content
  final EdgeInsetsGeometry? padding;

  /// Custom spacing between elements
  final double? spacing;

  /// Whether to show the icon (default: true)
  final bool showIcon;

  /// Compact mode for smaller spaces (default: false)
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorColor = iconColor ?? theme.colorScheme.error;
    final bgColor = backgroundColor ?? Theme.of(context).colorScheme.onSurface;

    final defaultPadding =
        padding ??
        EdgeInsets.symmetric(
          horizontal: compact ? 16.w : 24.w,
          vertical: compact ? 20.h : 32.h,
        );

    final defaultSpacing = spacing ?? (compact ? 12.h : 16.h);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(compact ? 16.w : 20.w),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500.w),
            padding: defaultPadding,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(compact ? 16.r : 20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Section
                if (showIcon) ...[
                  Container(
                    padding: EdgeInsets.all(compact ? 16.w : 20.w),
                    decoration: BoxDecoration(
                      color: errorColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child:
                        icon ??
                        Icon(
                          Icons.error_outline_rounded,
                          size: compact ? 48.sp : 64.sp,
                          color: errorColor,
                        ),
                  ),
                  SizedBox(height: defaultSpacing),
                ],

                // Title Section
                Text(
                  title ?? 'حدث خطأ ما!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold20(context).copyWith(
                    fontSize: compact ? 18.sp : 22.sp,
                    color: errorColor,
                  ),
                ),
                SizedBox(height: defaultSpacing * 0.5),

                // Error Message Section
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular14(context).copyWith(
                    fontSize: compact ? 13.sp : 15.sp,
                    // color: Colors.black,
                    // color: theme.textTheme.bodySmall?.color,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: defaultSpacing * 1.5),

                // Buttons Section
                if (onPressed != null || onBackPressed != null)
                  _buildButtons(context, compact),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context, bool compact) {
    final hasBothButtons = onPressed != null && onBackPressed != null;

    if (hasBothButtons) {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'إعادة تحميل الصفحة',
              onPressed: onPressed ?? () {},
              height: compact ? 44.h : 48.h,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomButton(
              text: 'العودة',
              onPressed: onBackPressed,
              height: compact ? 44.h : 48.h,
            ),
          ),
        ],
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: CustomButton(
          text: onPressed != null ? 'إعادة تحميل الصفحة' : 'العودة',
          onPressed: onPressed ?? onBackPressed ?? () {},
          height: compact ? 44.h : 48.h,
        ),
      );
    }
  }
}
