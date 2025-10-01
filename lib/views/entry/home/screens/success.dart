import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:homer_app/views/custom_features/custom_appbar.dart';
import 'package:homer_app/views/custom_features/custom_fullbutton.dart';

class SuccessScreen extends StatelessWidget {
  final String image;
  final String titleText;
  final String subtitleText;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessScreen({
    super.key,
    required this.image,
    required this.titleText,
    required this.subtitleText,
    this.buttonText = "Continue",
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        isReturn: false,
        isTitle: false,
        bgColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/images/lottie/Successs.json"),
              Text(
                titleText,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(textAlign: TextAlign.center, subtitleText),

              SizedBox(height: 32),
              TButton(onPressed: onPressed, buttonTitle: buttonText),
            ],
          ),
        ),
      ),
    );
  }
}
