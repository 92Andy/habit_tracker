import 'package:flutter/material.dart';

const firstSplitBarDefaultColor = Color(0xffFF9671);
const secondSplitBarDefaultColor = Color(0xffFF6F91);

const double defaultArcThickness = 20;
const double defaultDiameter = 180;
const TextStyle defaultTextStyle = TextStyle(
  color: firstSplitBarDefaultColor,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

typedef ProgressValueWidgetBuilder = Widget Function(int progressValue);

ProgressValueWidgetBuilder defaultProgressValueBuilder =
    (progressValue) => Text(
          '$progressValue %',
          style: const TextStyle(
            color: firstSplitBarDefaultColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
