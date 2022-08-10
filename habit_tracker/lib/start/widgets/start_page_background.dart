import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:rive/rive.dart';

class StartPageBackground extends StatelessWidget {
  const StartPageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _GradientBackground(),
        _Shaker(),
      ],
    );
  }
}

class _Shaker extends StatelessWidget {
  const _Shaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50.0,
      child: const SizedBox(
        height: 700,
        child: RiveAnimation.asset('assets/rive/shaker.riv'),
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledMiddleGradient,
      ),
    );
  }
}
