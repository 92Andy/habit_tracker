import 'package:flutter/material.dart';
import 'package:habit_tracker/add_habit/widgets/add_habit_background.dart';
import 'package:habit_tracker/widgets/custom_shaped_dark_app_bar.dart';
import 'package:habit_tracker/widgets/styled_button.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({
    Key? key,
    required this.navBack,
  }) : super(key: key);

  final VoidCallback navBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitTrackerAppBar(
        title: 'Add habit',
        onBackTapped: navBack,
      ),
      body: Stack(
        children: const [
          AddHabitBackground(),
          Padding(
            padding: EdgeInsets.only(
              top: 100,
              left: 30,
              right: 30,
            ),
            child: _AddHabitView(),
          ),
        ],
      ),
    );
  }
}

class _AddHabitView extends StatefulWidget {
  const _AddHabitView({Key? key}) : super(key: key);

  @override
  State<_AddHabitView> createState() => _AddHabitViewState();
}

class _AddHabitViewState extends State<_AddHabitView> {
  TextEditingController habitTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Habit title',
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 15,
            ),
            child: TextField(
              controller: habitTitleController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Habit Title',
                hintStyle: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'Choose an Activity',
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Container(
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        const SizedBox(height: 50),
        const Center(
          child: StyledButton(title: 'Add Habit'),
        ),
      ],
    );
  }
}
