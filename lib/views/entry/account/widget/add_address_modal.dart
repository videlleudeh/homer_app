import 'package:flutter/material.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TAddressModal extends StatelessWidget {
  const TAddressModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            Text(
              "Update Address",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TTextField(text: "Name", icon: Iconsax.user_copy),
            const SizedBox(height: 10),
            TTextField(text: "Phone No", icon: Iconsax.mobile_copy),
            const SizedBox(height: 10),
            TTextField(text: "Country", icon: Iconsax.global_copy),
            const SizedBox(height: 10),
            TTextField(text: "Street", icon: Iconsax.building_3_copy),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TTextField(text: "City", icon: Iconsax.building_copy),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TTextField(text: "State", icon: Iconsax.activity_copy),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              buttonTitle: "Save",
            ),
          ],
        ),
      ),
    );
  }
}

class TTextField extends StatelessWidget {
  const TTextField({
    super.key,
    required this.text,
    this.icon,
    this.isBorder = false,
    this.controller,
    this.validator,
  });

  final String text;
  final IconData? icon;
  final bool isBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: isBorder
            ? UnderlineInputBorder(borderSide: BorderSide.none)
            : null,
        prefixIcon: Icon(icon),
        labelText: text,
      ),
    );
  }
}
