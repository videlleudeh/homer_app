import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/provider/product_provider.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';

class THomeProducts extends ConsumerWidget {
  const THomeProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);

    return productState.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(child: Text("Not Found"));
        }
        return TGridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
            crossAxisSpacing: 16,
            mainAxisSpacing: 18,
          ),
          itemCount: products.length,
          scrollDirection: Axis.vertical,
          scrollPhysics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (cntxt, index) {
            final product = products[index];
            return TProductVCard(
              product: product,
              productThumbnail: product.thumbnail,
              productName: product.name,
              productPrice: product.price.toString(),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stackTrace) {
        print("$err");
        return Center(child: Text("Error: $err"));
      },
    );
  }
}
