import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
    required this.navToAddHabit,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) iconTapped;
  final VoidCallback navToAddHabit;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.only(
          right: 8.w,
          left: 8.w,
          top: 1.h,
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
            Expanded(
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    HabitTrackerColors.surfaceWhite.withOpacity(0.1),
                child: IconButton(
                  onPressed: null,
                  splashColor: HabitTrackerColors.surfaceWhite.withOpacity(0.1),
                  icon: Icon(
                    Icons.add,
                    size: 20,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
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
