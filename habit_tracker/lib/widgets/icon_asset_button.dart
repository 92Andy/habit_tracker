import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_colors.dart';
import 'package:habit_tracker/constants/habit_tracker_icons.dart';
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
    this.activateDoneAnimation = false,
  }) : super(key: key);

  final String iconAsset;
  final VoidCallback onTap;
  final Color? inactiveBackgroundColor;
  final Color? activeBackgroundColor;
  final Color? inactiveIconColor;
  final Color? activeIconColor;
  final bool activateDoneAnimation;

  @override
  State<IconAssetButton> createState() => _IconAssetButtonState();
}

class _IconAssetButtonState extends State<IconAssetButton>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  final Duration _animationDurationInMilliseconds =
      const Duration(milliseconds: 200);

  late Color _inactiveBackgroundColor;
  late Color _activeBackgroundColor;
  late Color _inactiveIconColor;
  late Color _activeIconColor;

  late String _iconAssetString;

  bool isTapped = false;
  Color get backGroundColor =>
      isTapped ? _activeBackgroundColor : _inactiveBackgroundColor;
  Color get iconColor => isTapped ? _activeIconColor : _inactiveIconColor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _animationDurationInMilliseconds,
      reverseDuration: _animationDurationInMilliseconds,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animation.addListener(() => setState(() {}));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setAnimationIconString();
        _animationController.reverse();
      }
    });

    _inactiveBackgroundColor =
        widget.inactiveBackgroundColor ?? Colors.grey.withOpacity(0.05);
    _activeIconColor = widget.activeIconColor ?? Colors.white;
    _activeBackgroundColor =
        widget.activeBackgroundColor ?? HabitTrackerColors.azureBlue;
    _inactiveIconColor =
        widget.inactiveIconColor ?? HabitTrackerColors.azureBlue;

    _iconAssetString = widget.iconAsset;
  }

  void setAnimationIconString() {
    if (_iconAssetString == widget.iconAsset) {
      _iconAssetString = HabitTrackerIcon.done;
    } else {
      _iconAssetString = widget.iconAsset;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8.w,
      backgroundColor: backGroundColor,
      child: IconButton(
        icon: Image.asset(
          _iconAssetString,
          height: 6.w - (6.w * _animation.value),
          color: iconColor,
        ),
        onPressed: () {
          if (widget.activateDoneAnimation) {
            _animationController.forward();
          }
          setState(() {
            isTapped = !isTapped;
          });
          widget.onTap();
        },
      ),
    );
  }
}
