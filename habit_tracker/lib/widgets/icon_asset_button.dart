import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconAssetButton extends StatefulWidget {
  const IconAssetButton({
    Key? key,
    required this.iconAsset,
    required this.onTap,
    this.inactiveBackgroundColor,
    this.activeBackgroundColor,
    this.inactiveIconColor,
    this.activeIconColor,
  }) : super(key: key);

  final String iconAsset;
  final VoidCallback onTap;
  final Color? inactiveBackgroundColor;
  final Color? activeBackgroundColor;
  final Color? inactiveIconColor;
  final Color? activeIconColor;

  @override
  State<IconAssetButton> createState() => _IconAssetButtonState();
}

class _IconAssetButtonState extends State<IconAssetButton> {
  late Color _inactiveBackgroundColor;
  late Color _activeBackgroundColor;
  late Color _inactiveIconColor;
  late Color _activeIconColor;

  bool isTapped = false;
  Color get backGroundColor =>
      isTapped ? _activeBackgroundColor : _inactiveBackgroundColor;
  Color get iconColor => isTapped ? _activeIconColor : _inactiveIconColor;

  @override
  void initState() {
    super.initState();
    _inactiveBackgroundColor =
        widget.inactiveBackgroundColor ?? Colors.grey.withOpacity(0.05);
    _activeIconColor = widget.activeIconColor ?? Colors.white;
    _activeBackgroundColor =
        widget.activeBackgroundColor ?? HabitTrackerColors.azureBlue;
    _inactiveIconColor =
        widget.inactiveIconColor ?? HabitTrackerColors.azureBlue;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8.w,
      backgroundColor: backGroundColor,
      child: IconButton(
        icon: Image.asset(
          widget.iconAsset,
          height: 7.w,
          color: iconColor,
        ),
        onPressed: () {
          setState(() {
            isTapped = !isTapped;
          });
          widget.onTap();
        },
      ),
    );
  }
}
