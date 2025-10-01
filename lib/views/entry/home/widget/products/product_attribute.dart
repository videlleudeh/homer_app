import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/account/widget/settings_listtile.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSettingsTile(
          title: "Product Size",
          leadingicon: Iconsax.size_copy,
          margin: const EdgeInsets.all(0),
          showBorder: false,
          height: 10,
          onTap: () {},
        ),

        TSettingsTile(
          title: "Material Used",
          leadingicon: Icons.autorenew_outlined,
          margin: const EdgeInsets.all(0),
          showBorder: false,
          height: 10,
          onTap: () {},
        ),

        TSettingsTile(
          title: "More Info",
          leadingicon: Icons.info_outline,
          margin: const EdgeInsets.all(0),
          showBorder: false,
          height: 10,
          onTap: () {},
        ),
      ],
    );
  }
}
