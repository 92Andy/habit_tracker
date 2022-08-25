import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';

class LightGradientBackgroundContainer extends StatelessWidget {
  const LightGradientBackgroundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledLightGradient,
      ),
    );
  }
}
