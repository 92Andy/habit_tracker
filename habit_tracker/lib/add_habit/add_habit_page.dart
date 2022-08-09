import 'package:flutter/material.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

import 'dart:ui' as ui;

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HabitTrackerAppBar(),
      body: Stack(
        children: const [
          _AddHabitBackground(),
          Center(
            child: Text('hallo'),
          ),
        ],
      ),
    );
  }
}

class _HabitTrackerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _HabitTrackerAppBar({
    Key? key,
    this.height = 200,
  }) : super(key: key);

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppBarCustomPainter(
        size: Size(
          MediaQuery.of(context).size.width,
          height * 3.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: height / 4,
          left: 30,
          right: 30,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      CustomColors.surfaceWhite.withOpacity(0.1)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors.surfaceWhite.withOpacity(0.1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    'Add Habit',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ui.Gradient get _AppBarGradient => ui.Gradient.linear(
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

class AppBarCustomPainter extends CustomPainter {
  const AppBarCustomPainter({
    required this.size,
  });

  final Size size;
  //Todo: size as parameter
  @override
  void paint(Canvas canvas, Size size) {
    size = this.size;
    Paint paint0 = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.solid,
        5,
      );
    paint0.shader = _AppBarGradient;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.1670379);
    path0.quadraticBezierTo(size.width * 0.3224600, size.height * 0.1737305,
        size.width * 0.3449800, size.height * 0.1756682);
    path0.cubicTo(
        size.width * 0.4464400,
        size.height * 0.1861136,
        size.width * 0.4269400,
        size.height * 0.2037862,
        size.width * 0.5001600,
        size.height * 0.2069376);
    path0.cubicTo(
        size.width * 0.5754200,
        size.height * 0.2041091,
        size.width * 0.5527000,
        size.height * 0.1875390,
        size.width * 0.6524400,
        size.height * 0.1783519);
    path0.quadraticBezierTo(size.width * 0.6743400, size.height * 0.1756125,
        size.width, size.height * 0.1661693);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.1670379);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
