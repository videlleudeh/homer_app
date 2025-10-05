import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/assets/images.dart';

import 'package:homer_app/views/entry/home/screens/all_product.dart';
import 'package:homer_app/views/entry/home/screens/checkout.dart';
import 'package:homer_app/views/entry/home/widget/carousel_image.dart';
import 'package:homer_app/views/entry/home/widget/carousel_slider.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_search.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/views/entry/home/widget/home_category.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';
import 'package:homer_app/custom_features/section_heading.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              title: "homer",
              iconButton: Icons.shopping_cart_outlined,
              isSubIcon: true,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CheckoutScreen()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const TSearchBar(),
                  const SizedBox(height: 20),
                  const TSectionHeading(title: "Categories", showButton: false),
                  const SizedBox(height: 16),
                  const THomeCategories(),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const TSectionHeading(
                        title: "Hot Deals",
                        showButton: false,
                      ),
                      const SizedBox(height: 16),
                      const ImageSlider(
                        banner: [
                          TCarouselImage(
                            image: TImages.bannerOne,
                            offer: "Up to 50% off on your first order.",
                          ),
                          TCarouselImage(
                            image: TImages.bannerTwo,
                            offer: "New Collection is Available!",
                          ),
                          TCarouselImage(
                            image: TImages.bannerThree,
                            offer: "Up to 50% off on your first order.",
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TSectionHeading(
                    title: "Products",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AllProductScreen(),
                        ),
                      );
                    },
                  ),
                  // SizedBox(height: 16),
                  TGridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 18,
                    ),
                    itemCount: 4,
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
          ],
        ),
      ),
    );
  }
}
