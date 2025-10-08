import 'package:flutter/material.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/round_image.dart';
import 'package:homer_app/models/product_model.dart';

class TProductDisplay extends StatelessWidget {
  final ProductModel product;
  const TProductDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(31, 199, 198, 198)),
      child: Stack(
        children: [
          // Product Image
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Image.network(product.imageUrl, fit: BoxFit.fill),
          ),

          //  App bar
          const TAppBar(
            isReturn: true,
            iconButton: Icons.share,
            isTitle: false,
            bgColor: Colors.transparent,
          ),

          //  Imaage Slider
          Positioned(
            bottom: 15,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => SizedBox(width: 8),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: TRoundImage(
                          image: product.imageUrl,
                          imageWidth: 60,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
