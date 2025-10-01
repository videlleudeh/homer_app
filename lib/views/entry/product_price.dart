import 'package:flutter/material.dart';

class TProductPrice extends StatelessWidget {
  const TProductPrice({
    super.key,
    this.isLarge = true,
    required this.isLineThrough,
    required this.price,
  });

  final bool isLineThrough, isLarge;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900)
          : Theme.of(context).textTheme.labelLarge!.copyWith(
              decoration: isLineThrough ? TextDecoration.lineThrough : null,
              color: Colors.grey,
            ),
    );
  }
}
