import 'package:flutter/material.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

LinearGradient get styledDarkLinearGradient => LinearGradient(
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

LinearGradient get styledLightLinearGradient => LinearGradient(
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
        CustomColors.primaryPurple.withOpacity(0.2),
        CustomColors.primaryBlue.withOpacity(0.25),
        CustomColors.primaryBlue.withOpacity(0.6),
        CustomColors.primaryBlue.withOpacity(0.4),
        CustomColors.primaryBlue.withOpacity(0.6),
        CustomColors.primaryBlue.withOpacity(0.7),
        CustomColors.primaryBlue,
      ],
    );
