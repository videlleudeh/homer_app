import 'package:flutter/material.dart';

class TLinearPIndicator extends StatelessWidget {
  const TLinearPIndicator({super.key, this.value, required this.text});

  final double? value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: LinearProgressIndicator(
              value: value,
              borderRadius: BorderRadius.circular(7),
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).colorScheme.primary,
              ),
              minHeight: 5,
            ),
          ),
        ),
      ],
    );
  }
}
