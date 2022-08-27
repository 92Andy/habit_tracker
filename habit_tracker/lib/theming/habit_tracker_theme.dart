import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/habit_tracker_colors.dart';

class HabitTrackerTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      textTheme: textLightTheme(),
      colorScheme: colorThemeLight(),
      scaffoldBackgroundColor: Colors.transparent,
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
      primary: HabitTrackerColors.purple,
      onPrimary: HabitTrackerColors.surfaceWhite,
      secondary: HabitTrackerColors.azureBlue,
      onSecondary: HabitTrackerColors.surfaceWhite,
      tertiary: HabitTrackerColors.olympicBlue,
      onTertiary: HabitTrackerColors.surfaceWhite,
      background: HabitTrackerColors.surfaceWhite,
      onBackground: HabitTrackerColors.azureBlue,
      surface: HabitTrackerColors.surfaceWhite,
      onSurface: HabitTrackerColors.cobaltBlue,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
