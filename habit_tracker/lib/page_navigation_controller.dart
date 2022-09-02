import 'package:flutter/material.dart';
import 'package:habit_tracker/add_habit/add_habit_page.dart';
import 'package:habit_tracker/overview/overview_page.dart';
import 'package:habit_tracker/start/start_page.dart';

class PageNavigationController extends StatefulWidget {
  const PageNavigationController({Key? key}) : super(key: key);

  @override
  State<PageNavigationController> createState() =>
      _PageNavigationControllerState();
}

class _PageNavigationControllerState extends State<PageNavigationController> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  void moveToNextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void navBack() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      controller: _controller,
      children: [
        StartPage(getStartedNavCallback: moveToNextPage),
        OverviewPage(navToAddHabitPage: moveToNextPage),
        AddHabitPage(navBack: navBack),
      ],
    );
  }
}
