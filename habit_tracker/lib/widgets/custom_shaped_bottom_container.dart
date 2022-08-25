import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'package:habit_tracker/theming/custom_colors.dart';

class CustomShapedBottomContainer extends StatelessWidget {
  const CustomShapedBottomContainer({
    Key? key,
    required this.child,
    this.height = 950,
    this.backgroundColor,
    this.backgroundGradient,
  }) : super(key: key);

  final Widget child;
  final double height;
  final Color? backgroundColor;
  final ui.Gradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BottomWhiteContainerPainter(
        height: height,
        width: MediaQuery.of(context).size.width,
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
      ),
      child: child,
    );
  }
}

class _BottomWhiteContainerPainter extends CustomPainter {
  const _BottomWhiteContainerPainter({
    required this.height,
    required this.width,
    this.backgroundColor,
    this.backgroundGradient,
  });

  final double height;
  final double width;
  final Color? backgroundColor;
  final ui.Gradient? backgroundGradient;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size(width, height);

    Paint? paint0;
    if (backgroundGradient != null) {
      paint0 = Paint()
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 5);
      paint0.shader = backgroundGradient;
    } else {
      paint0 = Paint()
        ..color = backgroundColor ?? CustomColors.surfaceWhite
        ..style = PaintingStyle.fill
        ..strokeWidth = 1;
    }

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5128718);
    path0.cubicTo(
        size.width * 0.5023889,
        size.height * 0.5102564,
        size.width * 0.4022222,
        size.height * 0.4863077,
        size.width * 0.4997222,
        size.height * 0.4847949);
    path0.cubicTo(
        size.width * 0.6039444,
        size.height * 0.4857949,
        size.width * 0.5029444,
        size.height * 0.5093846,
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
