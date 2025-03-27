import 'package:flutter/material.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/strings.dart';

class AppThemeData {
  static ThemeData themeData = ThemeData(
    fontFamily: AppStrings.arabicFont,
    splashColor: AppColors.transparentColor,
    highlightColor: AppColors.transparentColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(elevation: 0, foregroundColor: AppColors.whiteColor, backgroundColor: AppColors.greenColor, surfaceTintColor: AppColors.greenColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.blackColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.blackColor),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.blackColor),
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.blackColor),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.blackColor),
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.blackColor),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.blackColor),
    ),
  );
}
