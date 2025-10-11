import 'package:flutter/material.dart';

class TRoundIcon extends StatelessWidget {
  const TRoundIcon({
    super.key,
    this.onPressed,
    this.borderRadius = 100,
    this.width = 32,
    this.height = 32,
    this.iconSize = 25,
    this.iconColor = Colors.black,
    this.bgColor,
    this.icon,
    this.boxBorder,
  });

  final double? width;
  final double? height;
  final double? iconSize;
  final double borderRadius;
  final Color? bgColor;
  final Color? iconColor;
  final IconData? icon;
  final BoxBorder? boxBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        border: boxBorder,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(1),
        icon: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
