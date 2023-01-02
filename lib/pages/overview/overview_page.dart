import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/pages/overview/tabs/main_tab_page.dart';
import 'package:habit_tracker/pages/overview/widgets/bottom_nav_bar.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    Key? key,
  }) : super(key: key);

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
            ),
          ],
        ),
      ),
    );
  }
}
