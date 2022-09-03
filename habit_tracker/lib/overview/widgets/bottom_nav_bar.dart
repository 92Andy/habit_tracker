import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:habit_tracker/overview/widgets/add_habit_button.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
    required this.currentIndex,
    required this.navToAddHabitPage,
  }) : super(key: key);

  final Function(int) iconTapped;
  final int currentIndex;
  final VoidCallback navToAddHabitPage;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final double _bottomBarHeight = 16.h;
  final Duration _animationDurationInMilliseconds =
      const Duration(milliseconds: 300);
  late double _startPosition;
  late double _destPosition;

  bool _animationForward = false;

  @override
  void initState() {
    super.initState();
    _startPosition = 100.h;
    _destPosition = _startPosition - _bottomBarHeight;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 300), () {
        updateAnimation();
      });
    });
  }

  void updateAnimation() {
    setState(() {
      _animationForward = !_animationForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeIn,
      duration: _animationDurationInMilliseconds,
      top: _animationForward ? _destPosition : _startPosition,
      child: CurvedContainer(
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
              AddHabitButton(navToAddHabitPage: () async {
                updateAnimation();
                await Future.delayed(_animationDurationInMilliseconds, () {
                  widget.navToAddHabitPage();
                });
              }),
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
      ),
    );
  }
}
