import 'package:flutter/material.dart';

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
          color: CustomColors.primaryDarkBlue,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
        color: CustomColors.primaryBlue.withOpacity(0.2),
        fontSize: 12,
      ),
    );
  }

  static ColorScheme colorThemeLight() {
    return ColorScheme(
      primary: CustomColors.primaryPurple,
      onPrimary: CustomColors.primaryPurple,
      secondary: CustomColors.primaryDarkBlue,
      onSecondary: CustomColors.primaryDarkBlue,
      background: Colors.white,
      onBackground: Colors.white,
      surface: CustomColors.surfaceWhite,
      onSurface: CustomColors.surfaceWhite,
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.light,
    );
  }
}
