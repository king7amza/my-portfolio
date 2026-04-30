import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(bodyLarge: TextStyle(color: AppColors.black)),
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
      surfaceBright: AppColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
      hintStyle: TextStyle(color: AppColors.black),
    ),
  );
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(bodyLarge: TextStyle(color: AppColors.white)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.black,
      secondary: AppColors.lightGrey1,
      onSecondary: AppColors.white,
      surface: AppColors.darkBackgroundColor,
      shadow: AppColors.blackShadow,
      tertiary: AppColors.blueShadow,
      surfaceContainerHighest: AppColors.grey,
      surfaceContainerLowest: AppColors.transparent,
      outline: AppColors.footerColor,
      surfaceBright: AppColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
      // labelStyle: TextStyle(color: AppColors.white),
      hintStyle: TextStyle(color: AppColors.white),
    ),
  );
}
