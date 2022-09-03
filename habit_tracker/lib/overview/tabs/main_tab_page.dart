import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/icon_asset_button.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/constants/habit_tracker_icons.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/overview/domain/habit.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final List<Habit> todaysHabits = [
  Habit(
    title: 'Night Sleep',
    iconString: HabitTrackerIcon.sleep,
    status: HabitStatus.completed,
    startTime: '07:00 AM',
  ),
  Habit(
    title: 'Morning Walk',
    iconString: HabitTrackerIcon.walking,
    status: HabitStatus.completed,
    startTime: '09:00 AM',
  ),
  Habit(
    title: 'Cycling',
    iconString: HabitTrackerIcon.cycling,
    status: HabitStatus.completed,
    startTime: '10:00 AM',
  ),
  Habit(
    title: 'Swimming',
    iconString: HabitTrackerIcon.swimming,
    status: HabitStatus.completed,
    startTime: '03:00 PM',
  ),
  Habit(
    title: 'Weight Lifting',
    iconString: HabitTrackerIcon.weightLifting,
    status: HabitStatus.completed,
    startTime: '06:00 PM',
  ),
];

class MainTabPage extends StatelessWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Column(
              children: const [
                _GreetingUser(),
                _HabitProgress(),
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

class _GreetingUser extends StatelessWidget {
  const _GreetingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundColor: HabitTrackerColors.purple.withOpacity(.15),
          child: Image.asset(
            HabitTrackerIcon.batman,
            height: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Good Day 👋',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: HabitTrackerColors.cobaltBlue),
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
    );
  }
}

class _HabitProgress extends StatelessWidget {
  const _HabitProgress({Key? key}) : super(key: key);

  final Widget _spacer = const SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProgressEntry(
                iconData: Icons.bed_rounded,
                iconColor: HabitTrackerColors.azureBlue,
                name: 'Sleep',
              ),
              _spacer,
              _ProgressEntry(
                iconData: Icons.directions_walk_outlined,
                iconColor: HabitTrackerColors.purple,
                name: 'Walking',
              ),
              _spacer,
              _ProgressEntry(
                iconData: Icons.directions_bike_outlined,
                iconColor: HabitTrackerColors.olympicBlue,
                name: 'Cycling',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressEntry extends StatelessWidget {
  const _ProgressEntry({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.name,
  }) : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: 3.h,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13),
        )
      ],
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
            padding: EdgeInsets.only(
              top: 8.h,
              left: 10.w,
              right: 10.w,
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
                Expanded(
                  child: ListView.builder(
                    itemCount: todaysHabits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _TodayHabitCard(habit: todaysHabits[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TodayHabitCard extends StatefulWidget {
  const _TodayHabitCard({
    Key? key,
    required this.habit,
  }) : super(key: key);

  final Habit habit;

  @override
  State<_TodayHabitCard> createState() => _TodayHabitCardState();
}

class _TodayHabitCardState extends State<_TodayHabitCard> {
  bool _isTapped = false;
  Color get backGroundColor => _isTapped
      ? HabitTrackerColors.azureBlue.withOpacity(.3)
      : Colors.white.withOpacity(.1);
  Color get borderColor =>
      _isTapped ? Colors.white.withOpacity(.3) : Colors.white.withOpacity(.5);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: IconAssetButton(
                  iconAsset: widget.habit.iconString,
                  inactiveBackgroundColor: Colors.white.withOpacity(.25),
                  inactiveIconColor: Colors.white,
                  activeIconColor: Colors.white,
                  activateDoneAnimation: true,
                  onTap: () {
                    setState(() {
                      _isTapped = !_isTapped;
                    });
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.habit.title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            widget.habit.startTime,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.habit.status.getString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
