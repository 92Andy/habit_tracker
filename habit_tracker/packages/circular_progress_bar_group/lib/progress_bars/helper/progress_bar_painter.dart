import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProgressBarPainter {
  static void paint(ProgressBarPaintInformation paintInfo) {
    final rect = Offset.zero & paintInfo.size;

    final paint = Paint()
      ..strokeWidth = paintInfo.thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = paintInfo.color;

    paintInfo.canvas.drawArc(
      rect.deflate(paintInfo.thickness / 2),
      paintInfo.startAngle,
      max(paintInfo.sweepAngle * paintInfo.progressValue / 100,
          precisionErrorTolerance),
      false,
      paint,
    );

    paintInfo.canvas.saveLayer(rect,
        Paint()..color = Colors.white.withOpacity(paintInfo.backgroundOpacity));

    paintInfo.canvas.drawArc(
      rect.deflate(paintInfo.thickness / 2),
      paintInfo.startAngle,
      paintInfo.sweepAngle,
      false,
      paint,
    );

    paintInfo.canvas.restore();
  }
}

class ProgressBarPaintInformation {
  const ProgressBarPaintInformation({
    required this.canvas,
    required this.size,
    required this.thickness,
    required this.progressValue,
    required this.color,
    required this.backgroundOpacity,
    required this.startAngle,
    required this.sweepAngle,
  });

  final Canvas canvas;
  final Size size;
  final double thickness;
  final double progressValue;
  final Color color;
  final double backgroundOpacity;
  final double startAngle;
  final double sweepAngle;
}
