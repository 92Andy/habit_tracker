import 'dart:math';
import 'package:circular_progress_bar_group/progress_bars/helper/progress_bar_painter.dart';
import 'package:circular_progress_bar_group/progress_bars/models/split_bar_values.dart';
import 'package:flutter/material.dart';

class ForthSplitedProgressBar extends StatefulWidget {
  const ForthSplitedProgressBar({
    Key? key,
    this.diameter = 180,
    this.arcThickness = 12,
    this.firstSplitValues = const BarValues(value: 50),
    this.secondSplitValues = const BarValues(
      value: 70,
      color: secondSplitBarDefaultColor,
    ),
    this.thirdSplitValues = const BarValues(
      value: 90,
      color: Colors.green,
    ),
    this.forthSplitValues = const BarValues(
      value: 30,
      color: Colors.blue,
    ),
    this.progressIndicatorStyle,
  }) : super(key: key);

  final double diameter;
  final double arcThickness;
  final TextStyle? progressIndicatorStyle;
  final BarValues firstSplitValues;
  final BarValues secondSplitValues;
  final BarValues thirdSplitValues;
  final BarValues forthSplitValues;

  @override
  State<ForthSplitedProgressBar> createState() =>
      _ForthSplitedProgressBarState();
}

class _ForthSplitedProgressBarState extends State<ForthSplitedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ForthSplitedProgressBarPainter(
        firstSplitValues: widget.firstSplitValues,
        secondSplitValues: widget.secondSplitValues,
        thirdSplitValues: widget.thirdSplitValues,
        forthSplitValues: widget.forthSplitValues,
        thickness: widget.arcThickness,
      ),
      child: SizedBox.square(
        dimension: widget.diameter,
        child: Center(
          child: Text(
            '${((widget.firstSplitValues.value + widget.secondSplitValues.value + widget.thirdSplitValues.value + widget.forthSplitValues.value) / 4).floor()}%',
            style: widget.progressIndicatorStyle ??
                const TextStyle(
                  color: firstSplitBarDefaultColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

class _ForthSplitedProgressBarPainter extends CustomPainter {
  const _ForthSplitedProgressBarPainter({
    required this.thickness,
    required this.firstSplitValues,
    required this.secondSplitValues,
    required this.thirdSplitValues,
    required this.forthSplitValues,
  });

  final double thickness;
  final BarValues firstSplitValues;
  final BarValues secondSplitValues;
  final BarValues thirdSplitValues;
  final BarValues forthSplitValues;

  @override
  void paint(Canvas canvas, Size size) {
    _paintFirstSplit(canvas, size);
    _paintSecondSplit(canvas, size);
    _paintThirdSplit(canvas, size);
    _paintForthSplit(canvas, size);
  }

  void _paintFirstSplit(Canvas canvas, Size size) {
    const sweepAngle = pi / 2 - .4;
    const startAngle = pi + .2;

    final paintInfo = ProgressBarPaintInformation(
      canvas: canvas,
      size: size,
      thickness: thickness,
      progressValue: firstSplitValues.value,
      color: firstSplitValues.color,
      backgroundOpacity: firstSplitValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  void _paintSecondSplit(Canvas canvas, Size size) {
    const sweepAngle = pi / 2 - .4;
    const startAngle = 3 * pi / 2 + .2;

    final paintInfo = ProgressBarPaintInformation(
      canvas: canvas,
      size: size,
      thickness: thickness,
      progressValue: secondSplitValues.value,
      color: secondSplitValues.color,
      backgroundOpacity: secondSplitValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  void _paintThirdSplit(Canvas canvas, Size size) {
    const sweepAngle = pi / 2 - .4;
    const startAngle = 2 * pi + .2;

    final paintInfo = ProgressBarPaintInformation(
      canvas: canvas,
      size: size,
      thickness: thickness,
      progressValue: thirdSplitValues.value,
      color: thirdSplitValues.color,
      backgroundOpacity: thirdSplitValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  void _paintForthSplit(Canvas canvas, Size size) {
    const sweepAngle = pi / 2 - .4;
    const startAngle = pi / 2 + .2;

    final paintInfo = ProgressBarPaintInformation(
      canvas: canvas,
      size: size,
      thickness: thickness,
      progressValue: forthSplitValues.value,
      color: forthSplitValues.color,
      backgroundOpacity: forthSplitValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  @override
  bool shouldRepaint(_ForthSplitedProgressBarPainter oldDelegate) =>
      firstSplitValues.value != oldDelegate.firstSplitValues.value ||
      secondSplitValues.value != oldDelegate.secondSplitValues.value ||
      thirdSplitValues.value != oldDelegate.thirdSplitValues.value ||
      forthSplitValues.value != oldDelegate.forthSplitValues.value;
}
