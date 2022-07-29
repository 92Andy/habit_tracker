import 'package:flutter/material.dart';

import 'custom_colors.dart';

class HabitTrackerTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      textTheme: textLightTheme(),
      primaryColor: CustomColors.primaryPurple,
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
}
