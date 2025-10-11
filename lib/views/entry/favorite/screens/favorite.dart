import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/provider/favorite_provider.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: const TAppBar(
        isReturn: true,
        title: "My Favorite",
        isCenter: true,
        iconButton: Icons.add,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: favorites.isEmpty
              ? Center(
                  child:
                      // Column(
                      //   // mainAxisSize: MainAxisSize.min,
                      //   children: [
                      Text(
                        "Ooops... Continue browsing to like products!",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                  // ],
                  // ),
                )
              : Column(
                  children: [
                    TGridView(
                      itemBuilder: (cntxt, index) {
                        final favoriteProduct = favorites[index];
                        return TProductVCard(
                          product: favoriteProduct,
                          productThumbnail: favoriteProduct.thumbnail,
                          productName: favoriteProduct.name,
                          productPrice: favoriteProduct.price.toStringAsFixed(
                            2,
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 18,
                      ),
                      itemCount: favorites.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
