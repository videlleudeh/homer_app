import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/custom_features/custom_search.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';
import 'package:homer_app/custom_features/round_container.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: "Products",
        isCenter: true,
        isReturn: true,
        iconButton: Icons.shopping_cart_outlined,
        isSubIcon: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TSearchBar(),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: TListView(
                  itemBuilder: (cntxt, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: TRoundContainer(
                        radius: 25,
                        child: Row(
                          children: [
                            Image.asset(
                              TImages.iconChair,
                              width: 30,
                              height: 30,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryFixedVariant,
                            ),
                            SizedBox(width: 8),
                            Text("Chair"),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),

              SizedBox(height: 16),
              TGridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 18,
                ),
                itemCount: 6,
                scrollDirection: Axis.vertical,
                scrollPhysics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (cntxt, index) {
                  return const TProductVCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
