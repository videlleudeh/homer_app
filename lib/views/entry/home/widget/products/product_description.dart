import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TProductDesc extends StatelessWidget {
  const TProductDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      "A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear. A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear.",
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      lessStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
