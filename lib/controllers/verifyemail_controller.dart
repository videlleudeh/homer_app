import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/repository/auth_repository.dart';
import 'package:homer_app/views/entry/home/screens/success.dart';

class VerifyemailController {
  final AuthRepository _authState = AuthRepository();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  VerifyemailController();

  // Send Email Verification Link
  sendEmailLink() async {
    try {
      await _authState.sendEmailLink();
      print("Email sent successfully");
    } catch (e) {
      print("Email sent failed");
      throw e.toString();
    }
  }

  // Timer to redirect after email verification
  setTimer(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      await _firebaseAuth.currentUser?.reload();

      final user = _firebaseAuth.currentUser;

      if (user != null && user.emailVerified) {
        timer.cancel();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SuccessScreen(
              image: TImages.verified,
              titleText: "Account successfully created!",
              subtitleText:
                  'Welcome to your ultimate shopping experience. Your account has been created. Unleash the joy of seamless online shopping.',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      }
    });
  }

  // Manually Check is Email is Veriified
  checkEmailVerification(BuildContext context) {
    final user = _firebaseAuth.currentUser;
    if (user != null && user.emailVerified) {
      print("Email verified!");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please check your inbox and click the verification link.",
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SuccessScreen(
            image: TImages.verified,
            titleText: "Account successfully created!",
            subtitleText:
                'Welcome to your ultimate shopping experience. Your account has been created. Unleash the joy of seamless online shopping.',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    } else {
      // Show message that email is not verified yet
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email not verified yet. Please check your inbox and click the verification link.",
          ),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
      print("Email verification failed");
    }
  }
}
