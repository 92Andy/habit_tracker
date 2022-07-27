import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _StartPageBackground(),
        ],
      ),
    );
  }
}

class _StartPageBackground extends StatelessWidget {
  const _StartPageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        //Todo: Here should be the color
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
        height: 650,
        child: RiveAnimation.asset('assets/rive/shaker.riv'),
      ),
    );
  }
}
