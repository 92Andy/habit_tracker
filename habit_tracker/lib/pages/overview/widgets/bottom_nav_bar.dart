import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:habit_tracker/page_navigation_controller.dart';
import 'package:habit_tracker/pages/overview/widgets/add_habit_button.dart';
import 'package:habit_tracker/widgets/curved_container.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) iconTapped;
  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final Duration _animationDurationInMilliseconds =
      const Duration(milliseconds: 300);
  double _animationOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 400), () {
        setState(() {
          _animationOpacity = 1.0;
        });
      });
    });
  }

  void disappearNavBar() {
    setState(() {
      _animationOpacity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: _animationDurationInMilliseconds,
      opacity: _animationOpacity,
      onEnd: () {
        if (_animationOpacity == 0.0) {
          InheritedPageNavigationController.of(context).navToNextPage();
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CurvedContainer(
          height: kBottomNavigationBarHeight * 2,
          color: Theme.of(context).colorScheme.secondary,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
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
              Align(
                alignment: Alignment.center,
                child: NavToAddHabitButton(
                  onTap: disappearNavBar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
