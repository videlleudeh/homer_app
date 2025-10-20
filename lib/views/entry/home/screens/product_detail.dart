import 'package:flutter/material.dart';
import 'package:homer_app/custom_features/round_image.dart';
import 'package:homer_app/models/product_model.dart';

import 'package:homer_app/views/entry/home/widget/products/product_attribute.dart';
import 'package:homer_app/views/entry/home/widget/products/product_description.dart';
import 'package:homer_app/views/entry/home/widget/products/product_review.dart';
import 'package:homer_app/views/entry/home/widget/products/product_display.dart';
import 'package:homer_app/views/entry/home/widget/products/product_metadata.dart';
import 'package:homer_app/custom_features/section_heading.dart';
import 'package:homer_app/views/entry/home/widget/products/product_bottomnav.dart';
import 'package:homer_app/views/entry/home/widget/products/product_similar.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

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
            TProductDisplay(product: widget.product),
            const SizedBox(height: 12),

            Container(
              margin: EdgeInsets.only(left: 14),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ListView.separated(
                shrinkWrap: true,

                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(width: 8),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: TRoundImage(
                      image: widget.product.imageUrl,
                      imageWidth: 65,
                    ),
                  );
                },
              ),
            ),

            // Product Details
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product MetaData
                  TProductMetaData(product: widget.product),
                  const SizedBox(height: 12),

                  //  Product Description
                  TProductDesc(product: widget.product),
                  const SizedBox(height: 12),

                  //  Product Attribute
                  TProductAttribute(),
                  const SizedBox(height: 12),

                  //  Product Review
                  TProductReview(),

                  //  Similar Products
                  const SizedBox(height: 12),
                  const TSectionHeading(
                    title: "Similar Products",
                    showButton: true,
                  ),
                  const SizedBox(height: 16),
                  TSimilarProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TProductBottomNav(product: widget.product),
    );
  }
}
