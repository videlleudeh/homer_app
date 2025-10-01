import 'package:flutter/material.dart';

class TRoundIcon extends StatelessWidget {
  const TRoundIcon({
    super.key,
    this.borderRadius = 100,
    this.width = 32,
    this.height = 32,
    this.iconSize = 25,
    this.iconColor = Colors.black,
    this.bgColor,
    this.icon,
    this.boxBorder,
  });

  final double? width, height, iconSize;
  final double borderRadius;
  final Color? bgColor, iconColor;
  final IconData? icon;
  final BoxBorder? boxBorder;

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
        onPressed: () {},
        padding: const EdgeInsets.all(1),
        icon: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
