import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/const/app_const.dart';


abstract class AppTextStyle {
  // Medium text styles
  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.shadow ,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.shadow ,
    );
  }

  static TextStyle medium18(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.shadow ,

    );
  }

  // Bold text styles
  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.shadow ,

    );
  }

  static TextStyle bold18(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.shadow ,

    );
  }

  static TextStyle bold20(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.shadow ,

    );
  }

  // Regular text styles
  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.shadow ,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.shadow ,
    );
  }

  static TextStyle bold12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle bold24(BuildContext context) {
    return _getTextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle bold14(BuildContext context) {
    return _getTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle bold15(BuildContext context) {
    return _getTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle medium12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.surface ,
    );
  }

  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
