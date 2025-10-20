import 'package:flutter/material.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:readmore/readmore.dart';

class TProductDesc extends StatelessWidget {
  final ProductModel product;
  const TProductDesc({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      product.description,
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
