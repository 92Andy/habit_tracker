import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/overview/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/widgets/curved_container.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledLightGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CurvedContainer(
                height: 500,
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HabitTrackerColors.purple,
                      HabitTrackerColors.olympicBlue,
                      HabitTrackerColors.azureBlue,
                      HabitTrackerColors.olympicBlue,
                    ],
                    stops: const [
                      0.1,
                      0.2,
                      0.5,
                      1,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
        ),
      ),
    );
  }
}
