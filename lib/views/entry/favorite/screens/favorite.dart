import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              TGridView(
                itemBuilder: (cntxt, index) {
                  return TProductVCard(
                    product: ProductModel(
                      id: "id",
                      name: "name",
                      imageUrl: "imageUrl",
                      thumbnail: "thumbnail",
                      price: 0,
                      salesPrice: 0,
                      description: "description",
                      categoryId: "categoryId",
                    ),
                    networkImage: false,
                    productThumbnail: TImages.light0ne,
                    productName: " Wooden Chair",
                    productPrice: "N35,000",
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 18,
                ),
                itemCount: 6,
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
