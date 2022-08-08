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
          color: colorThemeLight().onSurface,
          fontSize: 28,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
        color: colorThemeLight().onSurface.withOpacity(0.4),
        fontSize: 14,
      ),
      button: TextStyle(
        color: colorThemeLight().onPrimary,
        fontSize: 14,
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
