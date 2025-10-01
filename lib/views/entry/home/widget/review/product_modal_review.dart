import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/widget/products/product_review.dart';

import 'package:homer_app/views/entry/home/widget/review/customer_review.dart';

class TModalReview extends StatelessWidget {
  const TModalReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Ratings
          TProductReview(showButton: false),

          //  Product Review
          SizedBox(height: 32),
          TCustomerReview(),
          TCustomerReview(),
        ],
      ),
    );
  }
}
