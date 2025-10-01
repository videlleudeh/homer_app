// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/navigation.dart';
import 'package:homer_app/views/authentication/screens/auth_checker.dart';
import 'package:homer_app/views/authentication/screens/verify_email.dart';

class LoginController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscurePassword = true;
  LoginController();

  void dispose() {
    email.dispose();
    password.dispose();
  }

  Future<void> logIN(BuildContext context, WidgetRef ref) async {
    try {
      //           Check If Form Is Valid
      if (!formKey.currentState!.validate()) {
        return;
      }
      final authRepo = ref.read(authRepositoryProvider);
      //           Login User in Firebase
      await authRepo.logInUser(
        email: email.text.trim().toLowerCase(),
        password: password.text,
      );
      print("Login successful");

      final user = FirebaseAuth.instance.currentUser;
      print("🔍 Immediate check - User: ${user?.uid}");
      print("🔍 Immediate check - Verified: ${user?.emailVerified}");

      if (user != null && context.mounted) {
        if (user.emailVerified) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => HomeNav()));
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyEmailScreen()),
          );
        }
      }
    } catch (e) {
      //            Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
