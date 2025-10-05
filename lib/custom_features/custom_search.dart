import 'package:flutter/material.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search_outlined),
        hintText: "What are you looking for?",
        hintStyle: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: Colors.grey),
      ),
    );
  }
}
