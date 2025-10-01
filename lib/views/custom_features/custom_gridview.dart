import 'package:flutter/material.dart';

class TGridView extends StatelessWidget {
  const TGridView({
    super.key,
    required this.itemBuilder,
    required this.gridDelegate,
    required this.itemCount,
    required this.scrollDirection,
    required this.shrinkWrap,
    this.scrollPhysics,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final SliverGridDelegate gridDelegate;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: gridDelegate,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      padding: EdgeInsets.all(0),
      shrinkWrap: shrinkWrap,
      itemBuilder: itemBuilder,
      physics: scrollPhysics,
    );
  }
}
