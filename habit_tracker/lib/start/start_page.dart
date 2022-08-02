import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/painting/gradient.dart' as gradient;
import 'package:habit_tracker/theming/custom_colors.dart';
import 'package:rive/rive.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _StartPageBackground(),
          CustomPaint(
            size: Size(
                400,
                (400 * 2.1666666666666665)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 300,
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
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = CustomColors.surfaceWhite
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5128718);
    path0.cubicTo(
        size.width * 0.4435556,
        size.height * 0.5108718,
        size.width * 0.3334444,
        size.height * 0.4602308,
        size.width * 0.4995556,
        size.height * 0.4585897);
    path0.cubicTo(
        size.width * 0.6626111,
        size.height * 0.4601026,
        size.width * 0.5472222,
        size.height * 0.5109487,
        size.width,
        size.height * 0.5129487);
    path0.cubicTo(size.width, size.height * 0.6347115, size.width,
        size.height * 0.8977115, size.width, size.height);
    path0.cubicTo(size.width * 0.7500000, size.height, size.width * 0.2500000,
        size.height, 0, size.height);
    path0.cubicTo(0, size.height * 0.8976346, size.width * -0.0007778,
        size.height * 0.8197179, 0, size.height * 0.5128718);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
