import 'package:flutter/material.dart';

class TRoundImage extends StatelessWidget {
  const TRoundImage({
    super.key,
    required this.image,
    this.imageWidth,
    this.imageHeight,
  });

  final double? imageWidth, imageHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: imageHeight,
          width: imageWidth,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text("Image not found"));
          },
        ),
      ),
    );
  }
}
