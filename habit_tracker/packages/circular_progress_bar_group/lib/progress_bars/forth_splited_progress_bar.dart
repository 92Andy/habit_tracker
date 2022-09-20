import 'dart:math';
import 'package:circular_progress_bar_group/progress_bars/models/split_bar_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForthSplitedProgressBar extends StatefulWidget {
  const ForthSplitedProgressBar({
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
    this.forthSplitValues = const SplitBarValues(
      value: 30,
      color: Colors.blue,
    ),
    this.progressIndicatorStyle,
  }) : super(key: key);

  final double diameter;
  final double arcThickness;
  final TextStyle? progressIndicatorStyle;
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;
  final SplitBarValues thirdSplitValues;
  final SplitBarValues forthSplitValues;

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
  final SplitBarValues firstSplitValues;
  final SplitBarValues secondSplitValues;
  final SplitBarValues thirdSplitValues;
  final SplitBarValues forthSplitValues;

  @override
  void paint(Canvas canvas, Size size) {
    _paintFirstSplit(canvas, size);
    _paintSecondSplit(canvas, size);
    _paintThirdSplit(canvas, size);
    _paintForthSplit(canvas, size);
  }

  void _paintFirstSplit(Canvas canvas, Size size) {
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 5 * pi / 6 + .2;
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = firstSplitValues.color;

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      max(sweepAngle * firstSplitValues.value / 100, precisionErrorTolerance),
      false,
      paint,
    );

    canvas.saveLayer(
        rect,
        Paint()
          ..color =
              Colors.white.withOpacity(firstSplitValues.arcBackgroundOpacity));

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    canvas.restore();
  }

  void _paintSecondSplit(Canvas canvas, Size size) {
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 3 * pi / 2 + .2;
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = secondSplitValues.color;

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      max(sweepAngle * secondSplitValues.value / 100, precisionErrorTolerance),
      false,
      paint,
    );

    canvas.saveLayer(
        rect,
        Paint()
          ..color =
              Colors.white.withOpacity(secondSplitValues.arcBackgroundOpacity));

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    canvas.restore();
  }

  void _paintThirdSplit(Canvas canvas, Size size) {
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 1 * pi / 6 + .2;
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = thirdSplitValues.color;

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      max(sweepAngle * thirdSplitValues.value / 100, precisionErrorTolerance),
      false,
      paint,
    );

    canvas.saveLayer(
        rect,
        Paint()
          ..color =
              Colors.white.withOpacity(thirdSplitValues.arcBackgroundOpacity));

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    canvas.restore();
  }

  void _paintForthSplit(Canvas canvas, Size size) {
    const sweepAngle = 2 * pi * (1 / 3) - .4;
    const startAngle = 1 * pi / 6 + .2;
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = thirdSplitValues.color;

    canvas.drawArc(
      rect.deflate(thickness / 2),
      startAngle,
      max(sweepAngle * thirdSplitValues.value / 100, precisionErrorTolerance),
      false,
      paint,
    );

    canvas.saveLayer(
        rect,
        Paint()
          ..color =
              Colors.white.withOpacity(thirdSplitValues.arcBackgroundOpacity));

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
  bool shouldRepaint(_ForthSplitedProgressBarPainter oldDelegate) =>
      firstSplitValues.value != oldDelegate.firstSplitValues.value ||
      secondSplitValues.value != oldDelegate.secondSplitValues.value ||
      thirdSplitValues.value != oldDelegate.thirdSplitValues.value ||
      forthSplitValues.value != oldDelegate.forthSplitValues.value;
}
