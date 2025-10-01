import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/round_container.dart';

class CaterogyIconItem extends StatelessWidget {
  const CaterogyIconItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            TRoundContainer(
              width: 60,
              height: 60,
              bgColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Image.asset(
                image,
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
