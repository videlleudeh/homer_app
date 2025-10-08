import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/provider/product_provider.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';

class TSimilarProducts extends ConsumerWidget {
  const TSimilarProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    return Container(
      padding: EdgeInsets.all(0),
      height: 320,
      child: productState.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text("Not Found"));
          }
          return Container(
            padding: EdgeInsets.all(0),
            height: 320,
            child: TListView(
              itemBuilder: (cntxt, index) {
                final product = products[index];
                return TProductVCard(
                  product: product,
                  productThumbnail: product.thumbnail,
                  productName: product.name,
                  productPrice: product.price.toString(),
                  margin: EdgeInsets.only(right: 16, bottom: 10),
                );
              },
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stackTrace) {
          print("$err");
          return Center(child: Text("Error: $err"));
        },
      ),
    );
  }
}
