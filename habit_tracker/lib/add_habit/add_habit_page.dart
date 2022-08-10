import 'package:flutter/material.dart';
import 'package:habit_tracker/add_habit/widgets/add_habit_background.dart';
import 'package:habit_tracker/widgets/custom_shaped_dark_app_bar.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HabitTrackerAppBar(title: 'Add habit'),
      body: Stack(
        children: const [
          AddHabitBackground(),
          Center(
            child: Text('hallo'),
          ),
        ],
      ),
    );
  }
}
