import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.subTitle = "view all",
    this.showButton = true,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final bool showButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        if (showButton) TextButton(onPressed: onPressed, child: Text(subTitle)),
      ],
    );
  }
}
