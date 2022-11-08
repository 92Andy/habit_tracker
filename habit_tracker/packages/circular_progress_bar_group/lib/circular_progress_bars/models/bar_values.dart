import 'package:flutter/material.dart';

class BarValues {
  const BarValues({
    required this.value,
    required this.color,
    this.arcBackgroundOpacity = 0.3,
  });

  final double value;
  final Color color;
  final double arcBackgroundOpacity;
}
