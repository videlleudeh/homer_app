import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/provider/category_provider.dart';
import 'package:homer_app/views/entry/home/widget/caterogy_item.dart';
import 'package:homer_app/views/entry/store/screen/category.dart';

class THomeCategories extends ConsumerWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesProvider);

    return categoriesState.when(
      data: (categories) {
        if (categories.isEmpty) {
          return const Center(child: Text("Not Found"));
        }
        return SizedBox(
          height: 90,
          child: TListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CaterogyIconItem(
                image: category.image,
                title: category.name,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print("$err");
        return Center(child: Text("Error: $err"));
      },
    );
  }
}
