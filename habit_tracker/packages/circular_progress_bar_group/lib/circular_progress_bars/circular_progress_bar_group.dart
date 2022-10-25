import 'dart:math';

import 'package:circular_progress_bar_group/circular_progress_bars/helper/progress_bar_painter.dart';
import 'package:circular_progress_bar_group/circular_progress_bars/models/bar_values.dart';
import 'package:flutter/material.dart';

const double _defaultArcThickness = 20;
const double _defaultDiameter = 180;
const TextStyle _defaultTextStyle = TextStyle(
  color: firstSplitBarDefaultColor,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

typedef ProgressValueWidgetBuilder = Widget Function(int progressValue);

ProgressValueWidgetBuilder _defaultProgressValueBuilder =
    (progressValue) => Text(
          '$progressValue %',
          style: const TextStyle(
            color: firstSplitBarDefaultColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );

enum _GroupBarTyp {
  twoBars,
  threeBars,
  fourBars,
}

class CircularProgressBarGroup extends StatelessWidget {
  const CircularProgressBarGroup.twoBars({
    Key? key,
    required this.firstBarValues,
    required this.secondBarValues,
    this.diameter = _defaultDiameter,
    this.arcThickness = _defaultArcThickness,
    this.indicatorTextStyle = _defaultTextStyle,
    this.progressWidgetBuilder,
  })  : _type = _GroupBarTyp.twoBars,
        thirdBarValues = null,
        forthBarValues = null,
        super(key: key);

  const CircularProgressBarGroup.threeBars({
    Key? key,
    required this.firstBarValues,
    required this.secondBarValues,
    required this.thirdBarValues,
    this.diameter = _defaultDiameter,
    this.arcThickness = _defaultArcThickness,
    this.indicatorTextStyle = _defaultTextStyle,
    this.progressWidgetBuilder,
  })  : _type = _GroupBarTyp.threeBars,
        forthBarValues = null,
        assert(thirdBarValues != null),
        super(key: key);

  const CircularProgressBarGroup.fourBars({
    Key? key,
    required this.firstBarValues,
    required this.secondBarValues,
    required this.thirdBarValues,
    required this.forthBarValues,
    this.diameter = _defaultDiameter,
    this.arcThickness = _defaultArcThickness,
    this.indicatorTextStyle = _defaultTextStyle,
    this.progressWidgetBuilder,
  })  : _type = _GroupBarTyp.fourBars,
        assert(thirdBarValues != null),
        assert(forthBarValues != null),
        super(key: key);

  final double diameter;
  final double arcThickness;
  final BarValues firstBarValues;
  final BarValues secondBarValues;
  final BarValues? thirdBarValues;
  final BarValues? forthBarValues;
  final _GroupBarTyp _type;
  final TextStyle indicatorTextStyle;
  final ProgressValueWidgetBuilder? progressWidgetBuilder;

  int _getTotalPercentage() {
    switch (_type) {
      case _GroupBarTyp.twoBars:
        return ((firstBarValues.value + secondBarValues.value) / 2).floor();
      case _GroupBarTyp.threeBars:
        return ((firstBarValues.value +
                    secondBarValues.value +
                    thirdBarValues!.value) /
                3)
            .floor();
      case _GroupBarTyp.fourBars:
        return ((firstBarValues.value +
                    secondBarValues.value +
                    thirdBarValues!.value +
                    forthBarValues!.value) /
                4)
            .floor();
    }
  }

  CustomPainter getProgressBarPainter() {
    switch (_type) {
      case _GroupBarTyp.twoBars:
        return _TwoProgressBarPainter(
          thickness: arcThickness,
          firstBarValues: firstBarValues,
          secondBarValues: secondBarValues,
        );
      case _GroupBarTyp.threeBars:
        return _ThreeProgressBarPainter(
          thickness: arcThickness,
          firstBarValues: firstBarValues,
          secondBarValues: secondBarValues,
          thirdBarValues: thirdBarValues!,
        );
      case _GroupBarTyp.fourBars:
        return _FourProgressBarPainter(
          thickness: arcThickness,
          firstBarValues: firstBarValues,
          secondBarValues: secondBarValues,
          thirdBarValues: thirdBarValues!,
          forthBarValues: forthBarValues!,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: getProgressBarPainter(),
      child: SizedBox.square(
        dimension: diameter,
        child: Center(
          child: progressWidgetBuilder != null
              ? progressWidgetBuilder!(_getTotalPercentage())
              : _defaultProgressValueBuilder(_getTotalPercentage()),
        ),
      ),
    );
  }
}

class _TwoProgressBarPainter extends CustomPainter {
  const _TwoProgressBarPainter({
    required this.thickness,
    required this.firstBarValues,
    required this.secondBarValues,
  });

  final double thickness;
  final BarValues firstBarValues;
  final BarValues secondBarValues;

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
      progressValue: firstBarValues.value,
      color: firstBarValues.color,
      backgroundOpacity: firstBarValues.arcBackgroundOpacity,
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
      progressValue: secondBarValues.value,
      color: secondBarValues.color,
      backgroundOpacity: secondBarValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  @override
  bool shouldRepaint(_TwoProgressBarPainter oldDelegate) =>
      firstBarValues.value != oldDelegate.firstBarValues.value ||
      secondBarValues.value != oldDelegate.secondBarValues.value;
}

class _ThreeProgressBarPainter extends CustomPainter {
  const _ThreeProgressBarPainter({
    required this.thickness,
    required this.firstBarValues,
    required this.secondBarValues,
    required this.thirdBarValues,
  });

  final double thickness;
  final BarValues firstBarValues;
  final BarValues secondBarValues;
  final BarValues thirdBarValues;

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
      progressValue: firstBarValues.value,
      color: firstBarValues.color,
      backgroundOpacity: firstBarValues.arcBackgroundOpacity,
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
      progressValue: secondBarValues.value,
      color: secondBarValues.color,
      backgroundOpacity: secondBarValues.arcBackgroundOpacity,
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
      progressValue: thirdBarValues.value,
      color: thirdBarValues.color,
      backgroundOpacity: thirdBarValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  @override
  bool shouldRepaint(_ThreeProgressBarPainter oldDelegate) =>
      firstBarValues.value != oldDelegate.firstBarValues.value ||
      secondBarValues.value != oldDelegate.secondBarValues.value ||
      thirdBarValues.value != oldDelegate.thirdBarValues.value;
}

class _FourProgressBarPainter extends CustomPainter {
  const _FourProgressBarPainter({
    required this.thickness,
    required this.firstBarValues,
    required this.secondBarValues,
    required this.thirdBarValues,
    required this.forthBarValues,
  });

  final double thickness;
  final BarValues firstBarValues;
  final BarValues secondBarValues;
  final BarValues thirdBarValues;
  final BarValues forthBarValues;

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
      progressValue: firstBarValues.value,
      color: firstBarValues.color,
      backgroundOpacity: firstBarValues.arcBackgroundOpacity,
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
      progressValue: secondBarValues.value,
      color: secondBarValues.color,
      backgroundOpacity: secondBarValues.arcBackgroundOpacity,
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
      progressValue: thirdBarValues.value,
      color: thirdBarValues.color,
      backgroundOpacity: thirdBarValues.arcBackgroundOpacity,
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
      progressValue: forthBarValues.value,
      color: forthBarValues.color,
      backgroundOpacity: forthBarValues.arcBackgroundOpacity,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ProgressBarPainter.paint(paintInfo);
  }

  @override
  bool shouldRepaint(_FourProgressBarPainter oldDelegate) =>
      firstBarValues.value != oldDelegate.firstBarValues.value ||
      secondBarValues.value != oldDelegate.secondBarValues.value ||
      thirdBarValues.value != oldDelegate.thirdBarValues.value ||
      forthBarValues.value != oldDelegate.forthBarValues.value;
}
