import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/constants/habit_tracker_icons.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainTabPage extends StatelessWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: HabitTrackerColors.purpleLight,
                      child: Image.asset(
                        HabitTrackerIcon.batman,
                        height: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Good Day',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                          ),
                          Text(
                            'Andy Eckhardt',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.bed_rounded),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Sleep',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.directions_walk_rounded),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Walking',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.directions_bike_outlined),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Cycling',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _TodaysHabits(),
          ),
        ],
      ),
    );
  }
}

class _TodaysHabits extends StatelessWidget {
  const _TodaysHabits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedContainer(
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
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: HabitTrackerColors.surfaceWhite,
                          ),
                    ),
                    CircleAvatar(
                      radius: 6.w,
                      backgroundColor:
                          HabitTrackerColors.surfaceWhite.withOpacity(0.1),
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
    );
  }
}
