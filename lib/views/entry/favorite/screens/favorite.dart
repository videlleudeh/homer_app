import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/custom_features/round_image.dart';
import 'package:homer_app/provider/favorite_provider.dart';
import 'package:homer_app/views/entry/home/screens/all_product.dart';
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
      body: favorites.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TRoundImage(
                      isNetworkImage: false,
                      image: TImages.nothingFound,
                      imageHeight: 250,
                      imageWidth: 250,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Your wishlist is empty!",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      "Looks like you haven’t added anything to your wishlist yet ",
                    ),

                    SizedBox(height: 16),
                    TButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AllProductScreen(),
                          ),
                        );
                      },
                      buttonTitle: "Explore Now",
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
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
