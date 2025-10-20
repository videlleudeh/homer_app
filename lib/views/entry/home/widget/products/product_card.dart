import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_snackbar.dart';
import 'package:homer_app/models/cart_model.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/provider/cart_provider.dart';
import 'package:homer_app/provider/favorite_provider.dart';

import 'package:homer_app/views/entry/home/screens/product_detail.dart';
import 'package:homer_app/custom_features/round_icon.dart';
import 'package:homer_app/custom_features/round_image.dart';

class TProductVCard extends ConsumerWidget {
  final ProductModel product;
  final String productName;
  final String productThumbnail;
  final String productPrice;
  final EdgeInsetsGeometry? margin;
  final bool networkImage;
  const TProductVCard({
    super.key,
    required this.product,
    required this.productName,
    required this.productThumbnail,
    required this.productPrice,
    this.margin,
    this.networkImage = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProduct = ref.watch(favoriteProvider);
    final isFavorite = favoriteProduct.contains(product);

    void onFavorite() {
      final isAdded = ref
          .read(favoriteProvider.notifier)
          .onClickFavorite(product);
      showSuccessSnackbar(
        context,
        isAdded ? "Product Added to Favorite" : "Product Removed from Favorite",
        null,
      );
    }

    void onAddToCart() {
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
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        margin: margin,
        width: 180,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Thumbnail && Favorite Button && Add to Cart Button
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  TRoundImage(
                    isNetworkImage: networkImage,
                    image: productThumbnail,
                    imageWidth: double.infinity,
                    imageHeight: 200,
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: TRoundIcon(
                      bgColor: const Color.fromARGB(92, 197, 197, 195),
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      iconColor: isFavorite ? Colors.red : null,
                      onPressed: onFavorite,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(1),
                        onPressed: onAddToCart,
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  Text(
                    productPrice,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
