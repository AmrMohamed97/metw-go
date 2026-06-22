import 'package:flutter/material.dart';
import 'package:metw_go/core/const/app_const.dart';

import 'my_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: MyColors.primaryColor,
      scaffoldBackgroundColor: MyColors.white,
      fontFamily: AppConstant.kFontFamily,
      fontFamilyFallback: [AppConstant.kFontFamily],
      colorScheme: const ColorScheme.dark(
        primary: MyColors.primaryColor,
        secondary: MyColors.secondaryColor,
        surfaceDim: MyColors.purpleLight,
        tertiary: MyColors.textColor,
        onSurface: MyColors.grey,
        surfaceTint: MyColors.greyLight,
        outline: MyColors.greyFill,
        scrim: MyColors.offWhite,
        shadow: MyColors.black,
        surface: MyColors.white,
      ),
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: MyColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: MyColors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: MyColors.primaryColor),
      ),

      // Input Decoration (Glassy)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: BorderSide.none,
          borderSide: BorderSide(
            color: MyColors.greyFill.withValues(alpha: 0.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: MyColors.greyFill.withValues(alpha: 0.1),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: const BorderSide(color: MyColors.greyFill),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: const BorderSide(color: MyColors.greyFill),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: const BorderSide(color: MyColors.greyFill),
        ),
        hintStyle: TextStyle(color: MyColors.grey),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          foregroundColor: MyColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      bottomAppBarTheme: BottomAppBarThemeData(
        elevation: 0,
        shadowColor: MyColors.white,
        color: MyColors.white,
        surfaceTintColor: MyColors.white,
      ),
      // Text Theme
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: MyColors.black, fontSize: 17),
        bodyMedium: TextStyle(color: MyColors.black, fontSize: 15),
        titleLarge: TextStyle(
          color: MyColors.black,
          fontSize: 34,
          fontFamily: AppConstant.kFontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
