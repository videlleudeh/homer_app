import 'package:flutter/material.dart';

void showSuccessSnackbar(
  BuildContext context,
  String message,
  SnackBarAction? action,
) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        // "${cartItem.productName} Added to Cart",
        // : "${product.name} Removed from Favorite",
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      action: action,
    ),
  );
}
