import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplitBarValues {
  const SplitBarValues({
    this.value = 50,
    this.color = firstSplitBarDefaultColor,
    this.arcBackgroundOpacity = 0.3,
  });

  final double value;
  final Color color;
  final double arcBackgroundOpacity;
}

const firstSplitBarDefaultColor = Color(0xffFF9671);
const secondSplitBarDefaultColor = Color(0xffFF6F91);

class TwiceSplitedProgressBar extends StatefulWidget {
  const TwiceSplitedProgressBar({
    Key? key,
    this.diameter = 180,
    this.arcThickness = 20,
    this.firstSplitValues = const SplitBarValues(value: 10),
    this.secondSplitValues =
        const SplitBarValues(value: 30, color: secondSplitBarDefaultColor),
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
    const sweepAngle = 2.4 / 3 * pi;
    const startAngle = 4.8 / 3 * pi;
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

  @override
  bool shouldRepaint(_TwiceSplitedProgressBarPainter oldDelegate) =>
      firstSplitValues.value != oldDelegate.firstSplitValues.value ||
      secondSplitValues.value != oldDelegate.secondSplitValues.value;
}
