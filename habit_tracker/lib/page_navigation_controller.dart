import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/add_habit/add_habit_page.dart';
import 'package:habit_tracker/pages/overview/overview_page.dart';
import 'package:habit_tracker/pages/start/start_page.dart';

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

  void navToNextPage() {
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
    return InheritedPageNavigationController(
      navBack: navBack,
      navToNextPage: navToNextPage,
      child: PageView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          StartPage(),
          OverviewPage(),
          AddHabitPage(),
        ],
      ),
    );
  }
}

class InheritedPageNavigationController extends InheritedWidget {
  const InheritedPageNavigationController({
    super.key,
    required super.child,
    required this.navBack,
    required this.navToNextPage,
  });

  final VoidCallback navToNextPage;
  final VoidCallback navBack;

  @override
  bool updateShouldNotify(InheritedPageNavigationController oldWidget) {
    return navToNextPage != oldWidget.navToNextPage ||
        navBack != oldWidget.navBack;
  }

  static InheritedPageNavigationController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedPageNavigationController>()!;
}
