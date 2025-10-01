import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemIndicator extends StatelessWidget {
  const ItemIndicator({
    super.key,
    required this.controller,
    required this.count,
    required this.activeColor,
  });

  final PageController controller;
  final int count;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: SlideEffect(
        dotWidth: 40,
        dotHeight: 3,
        activeDotColor: activeColor,
      ),
    );
  }
}
