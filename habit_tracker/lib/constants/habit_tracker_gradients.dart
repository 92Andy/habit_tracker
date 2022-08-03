import 'package:flutter/material.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

final LinearGradient styledDarkLinearGradient = LinearGradient(
  colors: [
    CustomColors.primaryPurple.withOpacity(0.2),
    CustomColors.primaryBlue.withAlpha(-1).withOpacity(0.7),
    CustomColors.primaryDarkBlue.withAlpha(-1).withOpacity(0.8),
    CustomColors.primaryBlue.withAlpha(-1),
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

final LinearGradient styledLightLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: const [
    0.1,
    0.2,
    0.3,
    0.4,
    0.6,
    0.7,
    0.8,
  ],
  colors: <Color>[
    const Color(0xffF44FC2).withOpacity(0.2),
    const Color(0xff8EA7F5).withOpacity(0.25),
    const Color(0xff8EA7F5).withOpacity(0.2),
    const Color(0xff8EA7F5).withOpacity(0.5),
    const Color(0xff8EA7F5).withOpacity(0.4),
    const Color(0xff8EA7F5).withOpacity(0.7),
    const Color(0xff8EA7F5),
  ],
);
