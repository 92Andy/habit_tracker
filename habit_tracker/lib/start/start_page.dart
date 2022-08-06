import 'package:flutter/material.dart';
import 'package:habit_tracker/page_transition_test.dart';
import 'package:habit_tracker/start/widgets/start_page_background.dart';
import 'package:habit_tracker/start/widgets/white_custom_middle_bottom_container.dart';
import 'package:habit_tracker/widgets/styled_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
    required this.navigateToCallback,
  }) : super(key: key);

  final Function(NavigationPage) navigateToCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const StartPageBackground(),
          WhiteCustomMiddleBottomContainer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Text(
                      'Maintain Daily Habit',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        'A habit tracker is a simple way to measure '
                        'whether you did a habit. The most basic format'
                        'is to get a calender.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: StyledButton(
                          title: 'Get Started',
                          onTap: () =>
                              navigateToCallback(NavigationPage.testPage),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
