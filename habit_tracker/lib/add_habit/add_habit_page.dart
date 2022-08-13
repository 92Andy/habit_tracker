import 'package:flutter/material.dart';
import 'package:habit_tracker/add_habit/widgets/add_habit_background.dart';
import 'package:habit_tracker/add_habit/widgets/goal_gradient_slider.dart';
import 'package:habit_tracker/widgets/custom_shaped_dark_app_bar.dart';
import 'package:habit_tracker/widgets/styled_button.dart';

final List<Widget> iconButtons = [
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
  _CustomIconButton(
    iconData: Icons.model_training,
    onTap: () {},
  ),
];

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habit title',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          const _SmallSpacer(),
          _WhiteRoundedContainer(
            height: 60,
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
          const _MiddleSpacer(),
          Text(
            'Choose an Activity',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          const _SmallSpacer(),
          _WhiteRoundedContainer(
            height: 320,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 8,
                    spacing: 10,
                    children: iconButtons,
                  ),
                  const _MiddleSpacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select a goal',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GoalGradientSlider(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const _MiddleSpacer(),
          const Center(
            child: StyledButton(title: 'Add Habit'),
          ),
        ],
      ),
    );
  }
}

class _SmallSpacer extends StatelessWidget {
  const _SmallSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class _MiddleSpacer extends StatelessWidget {
  const _MiddleSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 50);
  }
}

class _WhiteRoundedContainer extends StatelessWidget {
  const _WhiteRoundedContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey.withOpacity(0.2),
      child: IconButton(
        icon: Icon(iconData),
        color: Theme.of(context).colorScheme.onBackground,
        onPressed: onTap,
      ),
    );
  }
}
