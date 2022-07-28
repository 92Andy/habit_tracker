import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/painting/gradient.dart' as gradient;
import 'package:rive/rive.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _StartPageBackground(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              color: const Color(0xffE9E9FF),
              child: Column(
                children: [
                  const Text('Maintain Daily Habit'),
                  const Text('A habit tracker is a simple way to measure '
                      'whether you did a habit. The most basic format'
                      'is to get a calender.'),
                  TextButton(
                    onPressed: null,
                    child: Container(
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Get Started'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
        height: 650,
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
        gradient: gradient.LinearGradient(
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
        ),
      ),
    );
  }
}
