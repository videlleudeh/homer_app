import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';

import 'package:homer_app/views/authentication/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    200.0,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(TImages.onboardFour),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TSignUpForm(),
          ],
        ),
      ),
    );
  }
}
