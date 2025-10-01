import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/entry/round_icon.dart';
import 'package:homer_app/views/entry/round_image.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key, this.showCounter = true});

  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TRoundImage(image: TImages.officeDesk, imageWidth: 100),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "VERNO",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "Steel Armchair",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Color: ",
                          children: [
                            TextSpan(
                              text: "Gunnared light green",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  showCounter
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TRoundIcon(
                                  width: 30,
                                  height: 30,
                                  bgColor: Colors.grey.shade300,
                                  icon: Iconsax.minus_copy,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  "2",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(width: 16),
                                TRoundIcon(
                                  width: 30,
                                  height: 30,
                                  bgColor: Colors.black54,
                                  iconColor: Colors.white,
                                  icon: Icons.add,
                                ),
                              ],
                            ),

                            Text(
                              "N35,000",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        )
                      : Text(
                          "N35,000",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
