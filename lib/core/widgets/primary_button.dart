import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/loading.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.onSecondaryTap,
    this.fixedSize = true,
    this.backgroundColor,
    this.horizontalPadding,
    this.height,
    this.isMax = false,
    this.radius,
    this.textColor,
  });
  final String text;
  final VoidCallback? onPressed, onSecondaryTap;
  final bool loading;
  final bool fixedSize;
  final Color? backgroundColor, textColor;
  final double? horizontalPadding, radius, height;
  final bool isMax;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 6.r),
        ),
        backgroundColor: backgroundColor,
        fixedSize: fixedSize ? Size.fromHeight(height ?? 46.h) : null,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: isMax ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.medium14(context).copyWith(
                  color: loading
                      ? Colors.transparent
                      : textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.center,
              ),
              LoadingWidget(
                color: loading ? Colors.white : Colors.transparent,
                loadingSize: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
