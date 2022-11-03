import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final BorderRadius _circularBorderRadius = BorderRadius.circular(16);

class StyledButton extends StatelessWidget {
  const StyledButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: _circularBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary,
            spreadRadius: -5,
            blurRadius: 10,
            offset: const Offset(
              0,
              15,
            ),
          ),
        ],
        gradient: styledDarkGradient,
      ),
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(borderRadius: _circularBorderRadius),
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.1),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
