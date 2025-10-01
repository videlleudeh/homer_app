import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/widget/review/product_modal_review.dart';
import 'package:homer_app/views/entry/home/widget/review/progress_indicator.dart';
import 'package:homer_app/views/entry/home/widget/review/star_rating.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';

class TProductReview extends StatelessWidget {
  const TProductReview({super.key, this.showButton = true});

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    void modalSheet() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (cntx) => TModalReview(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Review Text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Based on 133 reviews",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.apply(color: Colors.grey.shade700),
            ),
            if (showButton == true)
              TextButton(onPressed: modalSheet, child: Text("See details")),
          ],
        ),
        //  Product Ratings
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("4.5", style: Theme.of(context).textTheme.displayLarge),
                  TStarRating(rating: 4.5, size: 20),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  TLinearPIndicator(value: 0.8, text: "5"),
                  TLinearPIndicator(value: 0.6, text: "4"),
                  TLinearPIndicator(value: 0.5, text: "3"),
                  TLinearPIndicator(value: 0.5, text: "2"),
                  TLinearPIndicator(value: 0.2, text: "1"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    //  GestureDetector(
    //   onTap: modalSheet,
    //   child:
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Text(
    //       "Reviews(199)",
    //       style: Theme.of(context).textTheme.titleMedium,
    //     ),
    //     const Icon(Iconsax.arrow_right_1_copy),
    //   ],
    // ),
    // );
  }
}
