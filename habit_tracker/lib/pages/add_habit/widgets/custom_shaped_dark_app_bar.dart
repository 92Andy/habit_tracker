import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/page_navigation_controller.dart';
import 'package:habit_tracker/widgets/curved_container.dart';

class HabitTrackerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HabitTrackerAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  final double _height = 125;

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return CurvedContainer(
      height: _height,
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
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: _height / 3,
              left: 12,
              right: 12,
            ),
            child: SizedBox(
              height: 55,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: _NavBackButton(),
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
        ),
      ),
    );
  }
}

class _NavBackButton extends StatelessWidget {
  const _NavBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: InheritedPageNavigationController.of(context).navBack,
        color: Colors.white.withOpacity(0.15),
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
