import 'dart:math';

import 'package:circular_progress_bar_group/circular_progress_bars/models/bar_values.dart';
import 'package:circular_progress_bar_group/circular_progress_bars/utils/defaults.dart';
import 'package:circular_progress_bar_group/circular_progress_bars/utils/progress_bar_painter.dart';
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

const fullProgressBarDefaultColor = Color(0xffFF9671);

class FullCircularProgressBar extends StatefulWidget {
  const FullCircularProgressBar({
    Key? key,
    required this.progressBarValue,
    this.startPoint = FullCircularStartPoint.left,
    this.diameter = defaultDiameter,
    this.arcThickness = defaultArcThickness,
    this.progressWidgetBuilder,
  }) : super(key: key);

  final FullCircularStartPoint startPoint;
  final BarValues progressBarValue;
  final double diameter;
  final double arcThickness;
  final ProgressValueWidgetBuilder? progressWidgetBuilder;

  @override
  State<FullCircularProgressBar> createState() =>
      _FullCircularProgressBarState();
}

class _FullCircularProgressBarState extends State<FullCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FullCircularProgressBarPainter(
        value: widget.progressBarValue.value / 100,
        thickness: widget.arcThickness,
        startPoint: widget.startPoint,
        arcBackgroundOpacity: widget.progressBarValue.arcBackgroundOpacity,
        color: widget.progressBarValue.color,
      ),
      child: SizedBox.square(
        dimension: widget.diameter,
        child: Center(
          child: defaultProgressValueBuilder(
              widget.progressBarValue.value.floor()),
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
  });

  final double value;
  final double thickness;
  final FullCircularStartPoint startPoint;
  final double arcBackgroundOpacity;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const sweepAngle = pi * 2;
    final startAngle = startPoint.getRadian();

    final paintInfo = ProgressBarPaintInformation(
      canvas: canvas,
      size: size,
      thickness: thickness,
      progressValue: value,
      color: color,
      backgroundOpacity: arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  @override
  bool shouldRepaint(_FullCircularProgressBarPainter oldDelegate) =>
      value != oldDelegate.value;
}
