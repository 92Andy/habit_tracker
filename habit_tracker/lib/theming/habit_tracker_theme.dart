import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_colors.dart';

class HabitTrackerTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      textTheme: textLightTheme(),
      colorScheme: colorThemeLight(),
    );
  }

  static TextTheme textLightTheme() {
    return TextTheme(
      headline1: TextStyle(
          color: colorThemeLight().onSurface,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
        color: colorThemeLight().onSurface,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: colorThemeLight().onSurface.withOpacity(0.4),
        fontSize: 15.sp,
      ),
      button: TextStyle(
        color: colorThemeLight().onPrimary,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static ColorScheme colorThemeLight() {
    return ColorScheme(
      primary: CustomColors.purple,
      onPrimary: CustomColors.surfaceWhite,
      secondary: CustomColors.azureBlue,
      onSecondary: CustomColors.surfaceWhite,
      tertiary: CustomColors.olympicBlue,
      onTertiary: CustomColors.surfaceWhite,
      background: CustomColors.surfaceWhite,
      onBackground: CustomColors.azureBlue,
      surface: CustomColors.surfaceWhite,
      onSurface: CustomColors.cobaltBlue,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
