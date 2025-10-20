import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:homer_app/custom_features/round_icon.dart';

class TCartItem extends StatelessWidget {
  final String image;
  final String name;
  final int quantity;
  final double price;
  final void Function() onDelete;
  final void Function() onIncreaseQ;
  final void Function() onDecreaseQ;
  const TCartItem({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.onDelete,
    required this.onIncreaseQ,
    required this.onDecreaseQ,
    this.showCounter = true,
  });

  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: -1,
            blurRadius: 1.5,
            offset: const Offset(-1, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                height: 140,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text("Image not found"));
                },
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "VERNO",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      IconButton(
                        onPressed: onDelete,
                        icon: Icon(Icons.delete_outline),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Text(name, overflow: TextOverflow.ellipsis, softWrap: true),
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

                  showCounter
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TRoundIcon(
                                  onPressed: onDecreaseQ,
                                  width: 30,
                                  height: 30,
                                  bgColor: Colors.grey.shade300,
                                  icon: Iconsax.minus_copy,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  quantity.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(width: 16),
                                TRoundIcon(
                                  width: 30,
                                  height: 30,
                                  onPressed: onIncreaseQ,
                                  bgColor: Colors.black54,
                                  iconColor: Colors.white,
                                  icon: Icons.add,
                                ),
                              ],
                            ),

                            Text(
                              "N$price",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        )
                      : Text(
                          price.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
