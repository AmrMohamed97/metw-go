import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/loading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
    return AnimatedSize(
      duration: const Duration(milliseconds: 400),
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(loading ? 100 : radius ?? 8.r),
              bottomStart: Radius.circular(loading ? 100 : radius ?? 8.r),
              topEnd: Radius.circular(loading ? 100 : radius ?? 8.r),
              bottomEnd: Radius.circular(loading ? 100 : radius ?? 36.r),
            ),
          ),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          minimumSize: Size(
            loading ? 64 : (isMax ? double.infinity : 0),
            loading ? 64 : (fixedSize ? height ?? 46.h : 0),
          ),
          maximumSize: Size(
            loading ? 64 : double.infinity,
            loading ? 64 : (fixedSize ? height ?? 46.h : double.infinity),
          ),
        ),
        onPressed: loading ? () {} : onPressed,
        child: loading
            ? const LoadingWidget(color: Colors.white, loadingSize: 50)
            : Text(
                text,
                style: AppTextStyle.medium14(context).copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
