import 'package:flutter/material.dart';

class TButton extends StatelessWidget {
  const TButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.isButtonIcon = false,
  });

  final String buttonTitle;
  final void Function() onPressed;
  final bool isButtonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(buttonTitle),
          if (isButtonIcon) Icon(Icons.arrow_right_alt),
        ],
      ),
    );
  }
}
