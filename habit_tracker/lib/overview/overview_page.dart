import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/overview/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledLightGradient,
      ),
      child: const Scaffold(
        body: _OverviewView(),
      ),
    );
  }
}

class _OverviewView extends StatefulWidget {
  const _OverviewView({Key? key}) : super(key: key);

  @override
  State<_OverviewView> createState() => __OverviewViewState();
}

class __OverviewViewState extends State<_OverviewView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: CurvedContainer(
            height: 55.h,
            boxDecoration: BoxDecoration(
              gradient: styledFullGradient,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 10.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Todays Habits',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: HabitTrackerColors.surfaceWhite,
                                    ),
                          ),
                          CircleAvatar(
                            radius: 6.w,
                            backgroundColor: HabitTrackerColors.surfaceWhite
                                .withOpacity(0.1),
                            child: IconButton(
                              icon: Icon(Icons.menu,
                                  color: HabitTrackerColors.surfaceWhite),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavBar(
            currentIndex: 0,
            iconTapped: (i) {},
            navToAddHabit: () {},
          ),
        ),
      ],
    );
  }
}
