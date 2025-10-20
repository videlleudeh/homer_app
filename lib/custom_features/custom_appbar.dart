import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/provider/cart_provider.dart';

class TAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title = "HomeDec",
    this.isSubIcon = false,
    this.iconButton,
    this.isReturn = false,
    this.isCenter = false,
    this.isTitle = true,
    this.bgColor = Colors.white,
    this.onPressed,
  });

  final String title;
  final Color? bgColor;
  final IconData? iconButton;
  final void Function()? onPressed;
  final bool isReturn, isCenter, isSubIcon, isTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    return AppBar(
      backgroundColor: bgColor,
      automaticallyImplyLeading: isReturn,
      centerTitle: isCenter,
      title: isTitle
          ? Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(iconButton, size: 30),
              ),
              if (isSubIcon)
                Positioned(
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(child: Text(cartState.length.toString())),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
