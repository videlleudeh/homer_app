import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/screens/cart.dart';
import 'package:homer_app/custom_features/round_icon.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TProductBottomNav extends StatelessWidget {
  const TProductBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,

      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Row(
              children: [
                TRoundIcon(
                  width: 40,
                  height: 40,
                  bgColor: Colors.grey.shade300,
                  icon: Iconsax.minus_copy,
                ),
                SizedBox(width: 16),
                Text("2", style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(width: 16),
                TRoundIcon(
                  width: 40,
                  height: 40,
                  bgColor: Colors.black54,
                  iconColor: Colors.white,
                  icon: Icons.add,
                ),
              ],
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => CartScreen()));
              },
              label: const Text("Add to bag"),
              icon: const Icon(Icons.shopping_cart_outlined),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
