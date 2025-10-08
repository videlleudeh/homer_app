import 'package:flutter/material.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/custom_features/product_price.dart';

class TProductMetaData extends StatelessWidget {
  final ProductModel product;
  const TProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Brand Name & Price
          Row(
            children: [
              Text(
                "VERNO",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),
              ),
              Spacer(),
              TProductPrice(
                price: product.price.toString(),
                isLineThrough: true,
                isLarge: false,
              ),
              SizedBox(width: 6),
              TProductPrice(
                price: product.salesPrice.toString(),
                isLineThrough: false,
              ),
            ],
          ),
          //  Product Name
          SizedBox(height: 16),

          Text(product.name, style: Theme.of(context).textTheme.bodyLarge),

          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
              const Text("4.5"),
              const Text("(245)"),
            ],
          ),
        ],
      ),
    );
  }
}
