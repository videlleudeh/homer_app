import 'package:flutter/material.dart';

import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/authentication/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    200.0,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(TImages.onboardFour),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TLoginForm(),
          ],
        ),
      ),
    );
  }
}
