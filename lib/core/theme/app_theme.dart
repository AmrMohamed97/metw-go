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

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: MyColors.primaryColor,
      scaffoldBackgroundColor: const Color(0xFF1A1A2E),
      fontFamily: AppConstant.kFontFamily,
      fontFamilyFallback: [AppConstant.kFontFamily],
      colorScheme: const ColorScheme.dark(
        primary: MyColors.primaryColor,
        secondary: MyColors.secondaryColor,
        surfaceDim: Color(0xFF2A2045),
        tertiary: Color(0xFFEAEAEA),
        onSurface: Color(0xFF9E9EA8),
        surfaceTint: Color(0xFF2E2E42),
        outline: Color(0xFF3A3A52),
        scrim: Color(0xFF252535),
        shadow: Color(0xFF000000),
        surface: Color(0xFF16213E),
      ),
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF16213E),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFFEAEAEA),
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: MyColors.primaryColor),
      ),
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF252535),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3A3A52)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3A3A52)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: MyColors.primaryColor),
        ),
        hintStyle: const TextStyle(color: Color(0xFF6E6E80)),
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
        shadowColor: Color(0xFF16213E),
        color: Color(0xFF16213E),
        surfaceTintColor: Color(0xFF16213E),
      ),
      // Text Theme
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFEAEAEA), fontSize: 17),
        bodyMedium: TextStyle(color: Color(0xFFEAEAEA), fontSize: 15),
        titleLarge: TextStyle(
          color: Color(0xFFEAEAEA),
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
