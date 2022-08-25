import 'package:flutter/material.dart';
import 'package:habit_tracker/overview/tabs/main_tab_page.dart';
import 'package:habit_tracker/overview/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/theming/custom_colors.dart';
import 'package:habit_tracker/widgets/light_gradient_background_container.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [LightGradientBackgroundContainer()],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        iconTapped: (i) {},
        navToAddHabit: () {},
      ),
    );
  }
}
