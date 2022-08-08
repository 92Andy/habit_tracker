import 'package:flutter/material.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _AddHabitBackground(),
        ],
      ),
    );
  }
}

class _AddHabitBackground extends StatelessWidget {
  const _AddHabitBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: addHabitLinearGradient,
      ),
    );
  }
}

LinearGradient get addHabitLinearGradient => LinearGradient(
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
