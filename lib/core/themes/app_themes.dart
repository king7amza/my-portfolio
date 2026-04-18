import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.grey,
      onSecondary: AppColors.black,
      surface: AppColors.backgroundColor,
      shadow: AppColors.pinkShadow,
      tertiary: AppColors.greenShadow,
      surfaceContainerHighest: AppColors.lightGrey1,
      surfaceContainerLowest: AppColors.transparent,
      outline: AppColors.footerColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
    ),
  );
}
