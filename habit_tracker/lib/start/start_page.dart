import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/widgets/curved_container.dart';
import 'package:habit_tracker/widgets/styled_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
    required this.getStartedNavCallback,
  }) : super(key: key);

  final VoidCallback getStartedNavCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: styledMiddleGradient,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            const _Shaker(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CurvedContainer(
                height: 50.h,
                color: Theme.of(context).colorScheme.surface,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 35.h,
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
                              onTap: () => getStartedNavCallback(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Shaker extends StatelessWidget {
  const _Shaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50.0,
      child: SizedBox(
        height: 85.h,
        child: const RiveAnimation.asset('assets/rive/shaker.riv'),
      ),
    );
  }
}
