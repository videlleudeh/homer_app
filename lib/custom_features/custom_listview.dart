import 'package:flutter/material.dart';

class TListView extends StatelessWidget {
  const TListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.scrollDirection,
    required this.shrinkWrap,
    this.scrollPhysics,
    this.padding,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      physics: scrollPhysics,
    );
  }
}
