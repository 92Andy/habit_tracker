import 'package:flutter/material.dart';
import 'package:habit_tracker/start/widgets/start_page_background.dart';
import 'package:habit_tracker/start/widgets/white_custom_middle_bottom_bar.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const StartPageBackground(),
          WhiteCustomMiddleBottomBar(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    const Text('Maintain Daily Habit'),
                    const Text('A habit tracker is a simple way to measure '
                        'whether you did a habit. The most basic format'
                        'is to get a calender.'),
                    TextButton(
                      onPressed: null,
                      child: Container(
                        color: Colors.blue,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Get Started'),
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
