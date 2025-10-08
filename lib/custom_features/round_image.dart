import 'package:flutter/material.dart';

class TRoundImage extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final String image;
  final bool isNetworkImage;

  const TRoundImage({
    super.key,
    required this.image,
    this.imageWidth,
    this.imageHeight,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: isNetworkImage
            ? Image.network(
                image,
                fit: BoxFit.fill,
                height: imageHeight,
                width: imageWidth,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text("Image not found"));
                },
              )
            : Image.network(
                image,
                fit: BoxFit.fill,
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
