import 'package:flutter/material.dart';
import 'package:metw_go/core/const/app_const.dart';

import 'my_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: MyColors.purpleNormal,
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: AppConstant.kFontFamily,
      fontFamilyFallback: [AppConstant.kFontFamily2],
      colorScheme: const ColorScheme.light(
        primary: MyColors.purpleNormal,
        secondary: MyColors.purpleLight,
        surface: Color(0x1AFFFFFF),
      ),
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: MyColors.darkBlueLight,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: MyColors.purpleNormal),
      ),

      // Input Decoration (Glassy)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0x1AFFFFFF),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: MyColors.darkBlueLight.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: MyColors.purpleNormal),
        ),
        hintStyle: TextStyle(
          color: MyColors.darkBlueLight.withValues(alpha: 0.5),
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.purpleNormal,
          foregroundColor: MyColors.darkBlueLight,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: MyColors.darkBlueLight, fontSize: 17),
        bodyMedium: TextStyle(color: MyColors.darkBlueLight, fontSize: 15),
        titleLarge: TextStyle(
          color: MyColors.darkBlueLight,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
