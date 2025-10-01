import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/entry/store/screen/category.dart';

class TCategoryItem extends StatelessWidget {
  const TCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => CategoryScreen()));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          // .onPrimaryFixedVariant.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chair",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "5 products",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),

            Positioned(
              right: 5,
              top: -25,
              child: Image.asset(TImages.chairCategory, width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
