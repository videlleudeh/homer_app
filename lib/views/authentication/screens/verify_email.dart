import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/controllers/verifyemail_controller.dart';
import 'package:homer_app/views/custom_features/custom_appbar.dart';
import 'package:homer_app/views/custom_features/custom_fullbutton.dart';
import 'package:homer_app/views/entry/round_image.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  late VerifyemailController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VerifyemailController();
    _initializeVerification();
  }

  void _initializeVerification() async {
    await _controller.sendEmailLink();
    _controller.setTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        iconButton: Icons.clear,
        bgColor: Colors.transparent,
        isTitle: false,
        onPressed: Navigator.of(context).pop,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TRoundImage(
                image: TImages.verified,
                imageHeight: 250,
                imageWidth: 250,
              ),
              SizedBox(height: 20),
              Text(
                "Verify Your Email Address!",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                "Congratulations! Your Account has been created. Verify your email to start shopping and experience a world of unrivaled deals and personalized offers.",
              ),

              SizedBox(height: 16),
              TButton(
                onPressed: () => _controller.checkEmailVerification(context),
                buttonTitle: "Continue",
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => _controller.sendEmailLink,
                child: Text("Resend Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
