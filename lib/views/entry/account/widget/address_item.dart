import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/round_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TAddressItem extends StatelessWidget {
  const TAddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TRoundContainer(
        width: double.infinity,
        height: 110,
        radius: 12,
        bgColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Stack(
          children: [
            Positioned(right: 5, child: Icon(Iconsax.tick_circle_copy)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Claire Cooper",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text("+234 9039391432"),
                Text(
                  "20 Mariere hostel, UNEC, Enugu",
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
