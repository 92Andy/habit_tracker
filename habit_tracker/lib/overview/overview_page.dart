import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/overview/tabs/main_tab_page.dart';
import 'package:habit_tracker/overview/widgets/bottom_nav_bar.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    Key? key,
    required this.navToAddHabitPage,
  }) : super(key: key);

  final VoidCallback navToAddHabitPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledLightGradient,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            const MainTabPage(),
            BottomNavBar(
              currentIndex: 0,
              iconTapped: (i) {},
              navToAddHabitPage: navToAddHabitPage,
            ),
          ],
        ),
      ),
    );
  }
}
