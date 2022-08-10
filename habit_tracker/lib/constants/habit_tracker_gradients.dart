import 'package:flutter/material.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

import 'dart:ui' as ui;

LinearGradient get styledDarkGradient => LinearGradient(
      colors: [
        CustomColors.purple.withOpacity(0.2),
        CustomColors.olympicBlue.withAlpha(-1).withOpacity(0.7),
        CustomColors.azureBlue.withAlpha(-1).withOpacity(0.8),
        CustomColors.olympicBlue.withAlpha(-1),
      ],
      stops: const [
        0.1,
        0.2,
        0.5,
        1,
      ],
      begin: const Alignment(
        0.3,
        -3.5,
      ),
      end: Alignment.bottomRight,
    );

LinearGradient get styledMiddleGradient => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [
        0.1,
        0.17,
        0.3,
        0.45,
        0.6,
        0.7,
        0.8,
      ],
      colors: <Color>[
        CustomColors.purple.withOpacity(0.2),
        CustomColors.olympicBlue.withOpacity(0.25),
        CustomColors.olympicBlue.withOpacity(0.6),
        CustomColors.olympicBlue.withOpacity(0.4),
        CustomColors.olympicBlue.withOpacity(0.6),
        CustomColors.olympicBlue.withOpacity(0.7),
        CustomColors.olympicBlue,
      ],
    );

LinearGradient get styledLightGradient => LinearGradient(
      colors: [
        CustomColors.surfaceWhite,
        CustomColors.olympicBlueLight,
        CustomColors.purpleLight,
        CustomColors.surfaceWhite
      ],
      stops: const [
        0.1,
        0.35,
        0.6,
        1,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

ui.Gradient get darkGradientShader => ui.Gradient.linear(
    const Offset(0, 0),
    const Offset(200, 240),
    [
      CustomColors.azureBlue,
      CustomColors.olympicBlue,
      CustomColors.purple,
    ],
    [
      0.1,
      0.6,
      1,
    ],
    TileMode.clamp);
