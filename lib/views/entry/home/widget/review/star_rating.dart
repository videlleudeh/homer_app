import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TStarRating extends StatelessWidget {
  const TStarRating({super.key, required this.rating, required this.size});

  final double rating, size;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) =>
          Icon(Icons.star, color: Theme.of(context).colorScheme.primary),
      unratedColor: Colors.grey,
      rating: rating,
      itemSize: size,
    );
  }
}
