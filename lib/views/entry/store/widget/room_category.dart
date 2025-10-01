import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';

class TRoomCategoryItem extends StatelessWidget {
  const TRoomCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage(TImages.roomOne),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          "Kitchen",
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
