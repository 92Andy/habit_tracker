import 'package:flutter/material.dart';
import 'package:habit_tracker/start/start_page.dart';
import 'package:habit_tracker/theming/habit_tracker_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit tracker',
      theme: HabitTrackerTheme.lightTheme(),
      home: const StartPage(),
    );
  }
}
