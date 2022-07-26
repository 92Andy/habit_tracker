import 'package:flutter/material.dart';
import 'package:habit_tracker/start/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit tracker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const StartPage(),
    );
  }
}
