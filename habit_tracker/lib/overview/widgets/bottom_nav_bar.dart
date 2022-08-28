import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
    required this.middleWidget,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) iconTapped;
  final Widget middleWidget;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CurvedContainer(
      height: 16.h,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.only(
          right: 8.w,
          left: 8.w,
          top: 4.5.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.apps_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.access_time_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
            const Spacer(),
            middleWidget,
            const Spacer(),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.alarm,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
