import 'package:flutter/material.dart';

import 'package:homer_app/views/entry/home/widget/products/product_attribute.dart';
import 'package:homer_app/views/entry/home/widget/products/product_review.dart';
import 'package:homer_app/views/entry/home/widget/products/product_display.dart';
import 'package:homer_app/views/entry/home/widget/products/product_metadata.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';
import 'package:homer_app/custom_features/section_heading.dart';
import 'package:homer_app/views/entry/home/widget/products/product_bottomnav.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Product Display
            TProductDisplay(),

            // Product Details
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product MetaData
                  TProductMetaData(),
                  const SizedBox(height: 24),

                  //  Product Attribute
                  TProductAttribute(),
                  const SizedBox(height: 16),

                  //  Product Review
                  const Divider(),
                  const SizedBox(height: 10),
                  TProductReview(),
                  const SizedBox(height: 10),
                  const Divider(),

                  //  Similar Products
                  const SizedBox(height: 12),
                  const TSectionHeading(
                    title: "Similar Products",
                    showButton: true,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(0),
                    height: 320,
                    child: TListView(
                      itemBuilder: (cntxt, index) {
                        return const TProductVCard(
                          margin: EdgeInsets.only(right: 16, bottom: 10),
                        );
                      },
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TProductBottomNav(),
    );
  }
}
