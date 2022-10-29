import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';

class NavToAddHabitButton extends StatelessWidget {
  const NavToAddHabitButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final double _radius = 60;
  final double _blur = 2.5;
  final VoidCallback? onTap;

  BorderRadius get circularBorderRadius =>
      BorderRadius.all(Radius.circular(_radius));

  Color get whiteWithSmallOpacity => Colors.white.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _radius,
      width: _radius,
      decoration: BoxDecoration(
        gradient: styledFullWithLightPurpleGradient,
        borderRadius: circularBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: circularBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: _blur,
            sigmaY: _blur,
          ),
          blendMode: BlendMode.srcATop,
          child: Container(
            decoration: BoxDecoration(
              color: whiteWithSmallOpacity,
            ),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: onTap,
              shape: RoundedRectangleBorder(borderRadius: circularBorderRadius),
              splashColor: whiteWithSmallOpacity,
              highlightColor: whiteWithSmallOpacity,
              child: Icon(
                Icons.add,
                size: 25,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
