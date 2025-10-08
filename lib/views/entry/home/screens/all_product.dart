import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/custom_features/custom_search.dart';
import 'package:homer_app/provider/category_provider.dart';
import 'package:homer_app/provider/product_provider.dart';
import 'package:homer_app/views/entry/home/widget/products/product_card.dart';
import 'package:homer_app/custom_features/round_container.dart';

class AllProductScreen extends ConsumerWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    final categoryState = ref.watch(categoriesProvider);

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
                child: categoryState.when(
                  data: (categories) {
                    if (categories.isEmpty) {
                      return const Center(child: Text("Not Found"));
                    }
                    return TListView(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (cntxt, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: TRoundContainer(
                            radius: 25,
                            child: Row(
                              children: [
                                Image.network(
                                  category.image,
                                  width: 30,
                                  height: 30,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryFixedVariant,
                                ),
                                SizedBox(width: 8),
                                Text(category.name),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stackTrace) {
                    print("$err");
                    return Center(child: Text("Error: $err"));
                  },
                ),
              ),

              SizedBox(height: 16),

              productState.when(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
