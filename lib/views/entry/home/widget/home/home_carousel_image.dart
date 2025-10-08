import 'package:flutter/material.dart';

class TCarouselImage extends StatelessWidget {
  const TCarouselImage({super.key, required this.image, required this.offer});

  final String image, offer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: SizedBox(
            width: 200,
            child: Text(
              offer,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
