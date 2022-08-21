import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    Key? key,
    required this.iconAsset,
    required this.onTap,
  }) : super(key: key);

  final String iconAsset;
  final VoidCallback onTap;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isTapped = false;
  Color get backGroundColor => isTapped
      ? Theme.of(context).colorScheme.secondary
      : Colors.grey.withOpacity(0.05);
  Color get iconColor =>
      isTapped ? Colors.white : Theme.of(context).colorScheme.secondary;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8.w,
      backgroundColor: backGroundColor,
      child: IconButton(
        icon: Image.asset(
          widget.iconAsset,
          height: 8.w,
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
