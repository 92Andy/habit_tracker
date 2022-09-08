import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum FullCircularStartPoint {
  left,
  top,
  right,
  bottom,
}

extension FullCircularStartPointRadian on FullCircularStartPoint {
  double getRadian() {
    switch (this) {
      case FullCircularStartPoint.left:
        return pi;
      case FullCircularStartPoint.top:
        return 3 * pi / 2;
      case FullCircularStartPoint.right:
        return 0.0;
      case FullCircularStartPoint.bottom:
        return pi / 2;
    }
  }
}

const progressBarDefaultColor = Color(0xffFF9671);

class FullCircularProgressBar extends StatefulWidget {
  const FullCircularProgressBar({
    Key? key,
    this.diameter = 200,
    this.arcThickness = 20,
    this.value = 20,
    this.startPoint = FullCircularStartPoint.bottom,
    this.arcBackgroundOpacity = 0.3,
    this.color = progressBarDefaultColor,
    this.gradient,
    this.progressIndicatorStyle,
  }) : super(key: key);

  final double diameter;
  final double arcThickness;
  final double value;
  final FullCircularStartPoint startPoint;
  final double arcBackgroundOpacity;
  final Color color;
  final ui.Gradient? gradient;
  final TextStyle? progressIndicatorStyle;

  @override
  State<FullCircularProgressBar> createState() =>
      _FullCircularProgressBarState();
}

class _FullCircularProgressBarState extends State<FullCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FullCircularProgressBarPainter(
        value: widget.value / 100,
        thickness: widget.arcThickness,
        startPoint: widget.startPoint,
        arcBackgroundOpacity: widget.arcBackgroundOpacity,
        color: widget.color,
        gradient: widget.gradient,
      ),
      child: SizedBox.square(
        dimension: widget.diameter,
        child: Center(
          child: Text(
            '${(widget.value).floor()}%',
            style: widget.progressIndicatorStyle ??
                const TextStyle(
                  color: progressBarDefaultColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

class _FullCircularProgressBarPainter extends CustomPainter {
  const _FullCircularProgressBarPainter({
    required this.value,
    required this.thickness,
    required this.startPoint,
    required this.color,
    required this.arcBackgroundOpacity,
    this.gradient,
  });

  final double value;
  final double thickness;
  final FullCircularStartPoint startPoint;
  final double arcBackgroundOpacity;
  final Color color;
  final ui.Gradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    const sweepAngle = pi * 2;
    final startAngle = startPoint.getRadian();
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (gradient != null) {
      paint.shader = gradient;
    } else {
      paint.color = color;
    }

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      max(sweepAngle * value, precisionErrorTolerance),
      false,
      paint,
    );

    canvas.saveLayer(
        rect, Paint()..color = Colors.white.withOpacity(arcBackgroundOpacity));

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_FullCircularProgressBarPainter oldDelegate) =>
      value != oldDelegate.value;
}
