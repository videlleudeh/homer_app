import 'package:flutter/material.dart';

class TRoundContainer extends StatelessWidget {
  const TRoundContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = 100,
    this.padding = const EdgeInsets.all(12),
    this.bgColor = const Color.fromARGB(92, 236, 236, 231),
    this.boxBorder,
  });

  final Widget? child;
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final BoxBorder? boxBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
        border: boxBorder,
      ),

      child: child,
    );
  }
}
