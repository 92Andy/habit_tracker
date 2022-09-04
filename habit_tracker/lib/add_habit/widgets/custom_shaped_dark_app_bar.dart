import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HabitTrackerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  HabitTrackerAppBar({
    Key? key,
    required this.title,
    this.onBackTapped,
  }) : super(key: key);

  final String title;
  final VoidCallback? onBackTapped;

  final double _height = 15.h;

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return CurvedContainer(
      height: 18.h,
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HabitTrackerColors.azureBlue.withOpacity(0.85),
            HabitTrackerColors.olympicBlue,
            HabitTrackerColors.purple
          ],
          stops: const [
            0.05,
            0.3,
            0.6,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      curveType: ContainerCurveType.bottom,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      HabitTrackerColors.surfaceWhite.withOpacity(0.1),
                  child: IconButton(
                    onPressed: onBackTapped,
                    splashColor:
                        HabitTrackerColors.surfaceWhite.withOpacity(0.1),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
