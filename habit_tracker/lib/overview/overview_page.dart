import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/overview/tabs/main_tab_page.dart';
import 'package:habit_tracker/overview/widgets/add_habit_button.dart';
import 'package:habit_tracker/overview/widgets/bottom_nav_bar.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    Key? key,
    required this.navToAddHabitPage,
  }) : super(key: key);

  final VoidCallback navToAddHabitPage;

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
        extendBody: true,
        body: const MainTabPage(), //Todo: Andy
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
          iconTapped: (i) {},
          middleWidget:
              AddHabitButton(navToAddHabitPage: widget.navToAddHabitPage),
        ),
      ),
    );
  }
}
