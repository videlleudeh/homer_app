import 'package:flutter/material.dart';
// import 'package:homer_app/views/entry/home/widget/cart/cart_item.dart';
import 'package:homer_app/custom_features/round_container.dart';

class TOrderDetailItem extends StatelessWidget {
  const TOrderDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TRoundContainer(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        radius: 12,
        bgColor: Colors.white,
        boxBorder: Border.all(color: Colors.grey),
        child: Column(
          children: [
            // const TCartItem(showCounter: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TRoundContainer(child: Text("In Progess")),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: const Text("Tracking"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
