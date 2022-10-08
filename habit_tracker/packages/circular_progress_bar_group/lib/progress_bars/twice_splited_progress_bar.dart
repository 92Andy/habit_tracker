import 'dart:math';
import 'package:circular_progress_bar_group/progress_bars/helper/progress_bar_painter.dart';
import 'package:circular_progress_bar_group/progress_bars/models/split_bar_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TwiceSplitedProgressBar extends StatefulWidget {
  const TwiceSplitedProgressBar({
    Key? key,
    this.diameter = 180,
    this.arcThickness = 20,
    this.firstSplitValues = const SplitBarValues(value: 85),
    this.secondSplitValues =
        const SplitBarValues(value: 93, color: secondSplitBarDefaultColor),
    this.progressIndicatorStyle,
  }) : super(key: key);

  final double diameter;
  final double arcThickness;
  final TextStyle? progressIndicatorStyle;
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;

  @override
  State<TwiceSplitedProgressBar> createState() =>
      _TwiceSplitedProgressBarState();
}

class _TwiceSplitedProgressBarState extends State<TwiceSplitedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TwiceSplitedProgressBarPainter(
        firstSplitValues: widget.firstSplitValues,
        secondSplitValues: widget.secondSplitValues,
        thickness: widget.arcThickness,
      ),
      child: SizedBox.square(
        dimension: widget.diameter,
        child: Center(
          child: Text(
            '${((widget.firstSplitValues.value + widget.secondSplitValues.value) / 2).floor()}%',
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

class _TwiceSplitedProgressBarPainter extends CustomPainter {
  const _TwiceSplitedProgressBarPainter({
    required this.thickness,
    required this.firstSplitValues,
    required this.secondSplitValues,
  });

  final double thickness;
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;

  @override
  void paint(Canvas canvas, Size size) {
    _paintFirstSplit(canvas, size);
    _paintSecondSplit(canvas, size);
  }

  void _paintFirstSplit(Canvas canvas, Size size) {
    const sweepAngle = 2.4 / 3 * pi;
    const startAngle = 1.8 / 3 * pi;

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
    const sweepAngle = 2.4 / 3 * pi;
    const startAngle = 4.8 / 3 * pi;

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

  @override
  bool shouldRepaint(_TwiceSplitedProgressBarPainter oldDelegate) =>
      firstSplitValues.value != oldDelegate.firstSplitValues.value ||
      secondSplitValues.value != oldDelegate.secondSplitValues.value;
}
