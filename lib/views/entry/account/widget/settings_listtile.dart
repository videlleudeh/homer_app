import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TSettingsTile extends StatelessWidget {
  const TSettingsTile({
    super.key,
    required this.title,
    this.leadingicon,
    this.onTap,
    this.margin = const EdgeInsetsGeometry.only(bottom: 8),
    this.showBorder = true,
    this.height,
  });

  final String title;
  final EdgeInsetsGeometry? margin;
  final IconData? leadingicon;
  final void Function()? onTap;
  final bool showBorder;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ListTile(
        minTileHeight: height,
        leading: Icon(
          leadingicon,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(title),
        trailing: Icon(Iconsax.arrow_right_3_copy, size: 16),
        onTap: onTap,
        shape: showBorder
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
      ),
    );
  }
}
