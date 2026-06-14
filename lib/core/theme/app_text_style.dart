import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/const/app_const.dart';

import 'my_colors.dart';

abstract class AppTextStyle {
  // Medium text styles
  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle medium18(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  // Bold text styles
  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle bold18(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle bold20(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  // Regular text styles
  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstant.kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color:
          Theme.of(context).textTheme.bodyMedium?.color ??
          MyColors.darkBlueLight,
    );
  }

  static TextStyle bold12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: MyColors.greyLight,
    );
  }

  static TextStyle bold24(BuildContext context) {
    return _getTextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle bold14(BuildContext context) {
    return _getTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: MyColors.greyLight,
    );
  }

  static TextStyle bold15(BuildContext context) {
    return _getTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: MyColors.greyLight,
    );
  }

  static TextStyle medium12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: MyColors.greyLight,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return _getTextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: MyColors.greyLight,
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
