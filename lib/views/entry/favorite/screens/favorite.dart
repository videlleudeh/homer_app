import 'package:flutter/material.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
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
                  return TProductVCard();
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
