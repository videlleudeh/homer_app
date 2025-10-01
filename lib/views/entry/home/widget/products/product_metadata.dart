import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/widget/products/product_description.dart';
import 'package:homer_app/views/entry/product_price.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

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
              const TProductPrice(
                price: "N45,000",
                isLineThrough: true,
                isLarge: false,
              ),
              SizedBox(width: 6),
              const TProductPrice(price: "N35,000", isLineThrough: false),
            ],
          ),
          //  Product Name
          SizedBox(height: 16),
          Text(
            "Armchair, Gunnared light green",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
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
          //  Product Description
          SizedBox(height: 12),
          const TProductDesc(),
        ],
      ),
    );
  }
}
