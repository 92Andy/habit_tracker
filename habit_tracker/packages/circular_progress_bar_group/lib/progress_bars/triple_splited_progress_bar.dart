import 'dart:math';
import 'package:circular_progress_bar_group/progress_bars/helper/progress_bar_painter.dart';
import 'package:circular_progress_bar_group/progress_bars/models/split_bar_values.dart';
import 'package:flutter/material.dart';

class TripleSplitedProgressBar extends StatefulWidget {
  const TripleSplitedProgressBar({
    Key? key,
    this.diameter = 180,
    this.arcThickness = 12,
    this.firstSplitValues = const SplitBarValues(value: 50),
    this.secondSplitValues = const SplitBarValues(
      value: 50,
      color: secondSplitBarDefaultColor,
    ),
    this.thirdSplitValues = const SplitBarValues(
      value: 50,
      color: Colors.green,
    ),
    this.progressIndicatorStyle,
  }) : super(key: key);

  final double diameter;
  final double arcThickness;
  final TextStyle? progressIndicatorStyle;
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;
  final SplitBarValues thirdSplitValues;

  @override
  State<TripleSplitedProgressBar> createState() =>
      _TripleSplitedProgressBarState();
}

class _TripleSplitedProgressBarState extends State<TripleSplitedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TripleSplitedProgressBarPainter(
        firstSplitValues: widget.firstSplitValues,
        secondSplitValues: widget.secondSplitValues,
        thirdSplitValues: widget.thirdSplitValues,
        thickness: widget.arcThickness,
      ),
      child: SizedBox.square(
        dimension: widget.diameter,
        child: Center(
          child: Text(
            '${((widget.firstSplitValues.value + widget.secondSplitValues.value + widget.thirdSplitValues.value) / 3).floor()}%',
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

class _TripleSplitedProgressBarPainter extends CustomPainter {
  const _TripleSplitedProgressBarPainter({
    required this.thickness,
    required this.firstSplitValues,
    required this.secondSplitValues,
    required this.thirdSplitValues,
  });

  final double thickness;
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;
  final SplitBarValues thirdSplitValues;

  @override
  void paint(Canvas canvas, Size size) {
    _paintFirstSplit(canvas, size);
    _paintSecondSplit(canvas, size);
    _paintThirdSplit(canvas, size);
  }

  void _paintFirstSplit(Canvas canvas, Size size) {
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 5 * pi / 6 + .2;

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
    const sweepAngle = 2 * pi * (1 / 3) - .4;
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
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 1 * pi / 6 + .2;

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

  @override
  bool shouldRepaint(_TripleSplitedProgressBarPainter oldDelegate) =>
      firstSplitValues.value != oldDelegate.firstSplitValues.value ||
      secondSplitValues.value != oldDelegate.secondSplitValues.value ||
      thirdSplitValues.value != oldDelegate.thirdSplitValues.value;
}
