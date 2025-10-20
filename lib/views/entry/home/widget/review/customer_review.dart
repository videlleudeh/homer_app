import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/widget/review/star_rating.dart';

class TCustomerReview extends StatelessWidget {
  const TCustomerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Awesome Product!",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Column(
                children: [
                  Text(
                    "clairecooper3",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    "12/03/25",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
          TStarRating(rating: 3.5, size: 16),
          SizedBox(height: 12),
          Text(
            "Show more Show more Show more Show more Show more Show more Show more Show more Show more Show more Show moreShow more ",
          ),
        ],
      ),
    );
  }
}
