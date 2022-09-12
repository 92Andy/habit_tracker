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
