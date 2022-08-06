import 'package:flutter/material.dart';
import 'package:habit_tracker/start/start_page.dart';

enum NavigationPage {
  startPage,
  testPage,
}

extension NavigationPageExtension on NavigationPage {
  int get navigationIndex {
    switch (this) {
      case NavigationPage.startPage:
        return 0;
      case NavigationPage.testPage:
        return 1;
    }
  }
}

class PageTransitionTest extends StatefulWidget {
  const PageTransitionTest({Key? key}) : super(key: key);

  @override
  State<PageTransitionTest> createState() => _PageTransitionTestState();
}

class _PageTransitionTestState extends State<PageTransitionTest> {
  int pageIndex = 0;

  void navigateToPage(NavigationPage toPage) {
    setState(() {
      pageIndex = toPage.navigationIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      controller: PageController(
        initialPage: pageIndex,
        keepPage: false,
      ),
      children: [
        StartPage(
          navigateToCallback: navigateToPage,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}
