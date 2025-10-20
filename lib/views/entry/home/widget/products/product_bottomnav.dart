import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_snackbar.dart';

import 'package:homer_app/models/cart_model.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/provider/cart_provider.dart';

class TProductBottomNav extends ConsumerWidget {
  final ProductModel product;
  const TProductBottomNav({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80,

      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "N${product.salesPrice}",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: () {
                  final cartItem = CartModel(
                    uid: product.id,
                    productImage: product.imageUrl,
                    productName: product.name,
                    productPrice: product.salesPrice,
                  );
                  ref.read(cartProvider.notifier).addToCart(cartItem);
                  showSuccessSnackbar(
                    context,
                    "${cartItem.productName} Added to Cart",
                    null,
                  );
                },
                label: const Text("Add to bag"),
                icon: const Icon(Icons.shopping_cart_outlined),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
