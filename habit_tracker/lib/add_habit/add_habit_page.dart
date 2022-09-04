import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';
import 'package:habit_tracker/widgets/icon_asset_button.dart';
import 'package:habit_tracker/add_habit/widgets/goal_gradient_slider.dart';
import 'package:habit_tracker/constants/habit_tracker_icons.dart';
import 'package:habit_tracker/add_habit/widgets/custom_shaped_dark_app_bar.dart';
import 'package:habit_tracker/widgets/styled_button.dart';

final List<Widget> iconButtons = [
  IconAssetButton(
    iconAsset: HabitTrackerIcon.gym,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.cycling,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.weightLifting,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.running,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.skippingRope,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.kettleBell,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.swimming,
    onTap: () {},
  ),
  IconAssetButton(
    iconAsset: HabitTrackerIcon.more,
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
    return Container(
      decoration: BoxDecoration(
        gradient: styledLightGradient,
      ),
      child: Scaffold(
        body: Column(
          children: [
            HabitTrackerAppBar(
              title: 'Add habit',
              onBackTapped: navBack,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: _AddHabitView(),
            ),
          ],
        ),
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
  final TextEditingController _habitTitleController = TextEditingController();

  final Widget smallSpacer = const SizedBox(height: 10);
  final Widget middleSpacer = const SizedBox(height: 50);

  @override
  void dispose() {
    _habitTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habit title',
            style: Theme.of(context).textTheme.headline2,
          ),
          smallSpacer,
          _WhiteRoundedContainer(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: TextField(
                controller: _habitTitleController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Habit Title',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
          middleSpacer,
          Text(
            'Choose an Activity',
            style: Theme.of(context).textTheme.headline2,
          ),
          smallSpacer,
          _WhiteRoundedContainer(
            height: 330,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 8,
                    spacing: 10,
                    children: iconButtons,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
                  middleSpacer,
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: GoalGradientSlider(),
                    ),
                  )
                ],
              ),
            ),
          ),
          middleSpacer,
          const Center(
            child: StyledButton(title: 'Add Habit'),
          ),
        ],
      ),
    );
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
