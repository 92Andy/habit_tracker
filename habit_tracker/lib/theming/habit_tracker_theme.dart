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
          color: CustomColors.headlineDarkBlue,
          fontSize: 28,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
        color: CustomColors.headlineDarkBlue.withOpacity(0.4),
        fontSize: 14,
      ),
      button: TextStyle(
        color: CustomColors.surfaceWhite,
        fontSize: 14,
        fontWeight: FontWeight.bold,
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
