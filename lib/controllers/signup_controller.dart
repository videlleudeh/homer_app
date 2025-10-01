import 'package:flutter/material.dart';
import 'package:homer_app/models/user.dart';
import 'package:homer_app/repository/auth_repository.dart';
import 'package:homer_app/repository/user_repository.dart';
import 'package:homer_app/views/authentication/screens/verify_email.dart';

class SignupController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepository _authState = AuthRepository();
  final UserRepository _userState = UserRepository();

  bool isLoading = false;
  bool obscurePassword = true;

  SignupController();

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
  }

  Future<void> signUpUser(BuildContext context) async {
    try {
      //           Check If Form Is Valid
      if (!formKey.currentState!.validate()) {
        return;
      }
      isLoading = true;
      //           Register & Save User in Firebase
      final credential = await _authState.resgisterUser(
        email: email.text.trim().toLowerCase(),
        password: password.text,
      );

      //            Save Authenticated User in FireStore
      final newUser = UserModel(
        uid: credential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim().toLowerCase(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: " ",
      );

      //        Store User in Firetore
      await _userState.storeUserData(newUser);

      //         Success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => VerifyEmailScreen()),
      );
    } catch (e) {
      //            Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign Up Error: ${e.toString()}"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      isLoading = false;
    }
  }
}
