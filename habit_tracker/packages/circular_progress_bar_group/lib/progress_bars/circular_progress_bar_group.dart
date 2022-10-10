import 'package:circular_progress_bar_group/progress_bars/models/split_bar_values.dart';
import 'package:flutter/material.dart';

const double _kArcThickness = 20;
const double _kDiameter = 180;

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
    this.diameter = _kDiameter,
    this.arcThickness = _kArcThickness,
  })  : _type = _GroupBarTyp.twoBars,
        thirdBarValues = null,
        forthBarValues = null,
        super(key: key);

  const CircularProgressBarGroup.threeBars({
    Key? key,
    required this.firstBarValues,
    required this.secondBarValues,
    required this.thirdBarValues,
    this.diameter = _kDiameter,
    this.arcThickness = _kArcThickness,
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
    this.diameter = _kDiameter,
    this.arcThickness = _kArcThickness,
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

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TwiceSplitedProgressBarPainter(
        firstSplitValues: widget.firstSplitValues,
        secondSplitValues: widget.secondSplitValues,
        thickness: widget.arcThickness,
      ),
      child: SizedBox.square(
        dimension: diameter,
        child: Center(
          child: Text(
            '$_getTotalPercentage()',
            style: const TextStyle(
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
