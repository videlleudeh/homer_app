import 'package:flutter/material.dart';

import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_listview.dart';
import 'package:homer_app/custom_features/custom_search.dart';
import 'package:homer_app/custom_features/custom_gridview.dart';
import 'package:homer_app/custom_features/section_heading.dart';
import 'package:homer_app/views/entry/store/widget/category_item.dart';
import 'package:homer_app/views/entry/store/widget/room_category.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: "HomeHaven",
        iconButton: Icons.shopping_cart_outlined,
        isSubIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              const TSearchBar(),
              const SizedBox(height: 20),
              const TSectionHeading(title: "Rooms", showButton: false),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: TGridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: false,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (cntxt, index) {
                    return const TRoomCategoryItem();
                  },
                ),
              ),
              const SizedBox(height: 20),
              const TSectionHeading(title: "Categories", showButton: false),
              const SizedBox(height: 16),
              SizedBox(
                child: TListView(
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (cntxt, index) {
                    return const TCategoryItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
