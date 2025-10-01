import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/custom_features/custom_appbar.dart';
import 'package:homer_app/views/entry/round_image.dart';

class TProductDisplay extends StatelessWidget {
  const TProductDisplay({super.key});

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
            child: Image.asset(TImages.light0ne, fit: BoxFit.fill),
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
                        child: const TRoundImage(
                          image: TImages.light,
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
