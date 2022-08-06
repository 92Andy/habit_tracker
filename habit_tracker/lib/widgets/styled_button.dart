import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary,
              spreadRadius: -5,
              blurRadius: 10,
              offset: const Offset(0, 15),
            ),
          ],
          gradient: styledDarkLinearGradient,
        ),
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
