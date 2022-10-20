import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';

import 'dart:ui' as ui;

class GoalGradientSlider extends StatefulWidget {
  const GoalGradientSlider({Key? key}) : super(key: key);

  @override
  State<GoalGradientSlider> createState() => _GoalGradientSliderState();
}

class _GoalGradientSliderState extends State<GoalGradientSlider> {
  double _value = 14;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: _GradientRectSliderTrackShape(darkenInactive: false),
        thumbShape: RoundSliderThumbShape(),
        trackHeight: 11,
        inactiveTrackColor: HabitTrackerColors.olympicBlueLight,
        valueIndicatorColor: HabitTrackerColors.purple,
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Slider(
        value: _value,
        min: 0,
        max: 50,
        divisions: 50,
        label: _value.round().toString(),
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}

class RoundSliderThumbShape extends SliderComponentShape {
  RoundSliderThumbShape();

  final double radius = 16;
  final Paint painter = Paint()
    ..shader = ui.Gradient.linear(
        const Offset(0, 73),
        const Offset(-50, 0),
        [
          HabitTrackerColors.olympicBlue,
          HabitTrackerColors.azureBlue,
          HabitTrackerColors.olympicBlue,
        ],
        [
          0.2,
          0.5,
          0.7,
        ],
        TileMode.mirror);

  final _indicatorShape = const RectangularSliderValueIndicatorShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    canvas.drawCircle(
      center,
      radius,
      painter
        ..shader = ui.Gradient.linear(
            Offset(center.dx - 50, center.dy),
            Offset(center.dx, center.dy + 50),
            [
              HabitTrackerColors.olympicBlue,
              HabitTrackerColors.azureBlue,
              HabitTrackerColors.olympicBlue,
            ],
            [
              0.2,
              0.5,
              0.7,
            ],
            TileMode.mirror),
    );
    _indicatorShape.paint(
      context,
      Offset(center.dx, center.dy - 5),
      activationAnimation: const AlwaysStoppedAnimation(1),
      enableAnimation: enableAnimation,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      textDirection: textDirection,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
    );
  }
}

class _GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  _GradientRectSliderTrackShape({
    this.darkenInactive = true,
  });

  final LinearGradient gradient = LinearGradient(
    colors: [
      HabitTrackerColors.purpleLight,
      HabitTrackerColors.olympicBlue,
      HabitTrackerColors.azureBlue,
    ],
    stops: const [
      0.2,
      0.6,
      1,
    ],
  );
  final bool darkenInactive;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
