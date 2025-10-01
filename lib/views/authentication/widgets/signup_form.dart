import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/controllers/form_controller.dart';
import 'package:homer_app/controllers/signup_controller.dart';
import 'package:homer_app/views/custom_features/custom_fullbutton.dart';
import 'package:homer_app/views/authentication/screens/login.dart';

class TSignUpForm extends ConsumerStatefulWidget {
  const TSignUpForm({super.key});

  @override
  ConsumerState<TSignUpForm> createState() => _TSignUpFormState();
}

class _TSignUpFormState extends ConsumerState<TSignUpForm> {
  late SignupController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignupController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _signUpUser() async {
    setState(() {
      _controller.isLoading = true;
    });

    await _controller.signUpUser(context);

    if (mounted) {
      setState(() {
        _controller.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final validForm = ref.watch(signUpFormProvider.notifier);

    return Form(
      key: _controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller.firstName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "First Name",
                    ),
                    autofocus: true,
                    validator: (value) => validForm.setFirstName(value),
                    onChanged: (value) => validForm.setFirstName(value),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _controller.lastName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Last Name",
                    ),

                    validator: (value) => validForm.setLastName(value),
                    onChanged: (value) => validForm.setLastName(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller.userName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Username",
                    ),
                    validator: (value) => validForm.setUserName(value),
                    onChanged: (value) => validForm.setUserName(value),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _controller.phoneNumber,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Phone No",
                    ),
                    validator: (value) => validForm.setPhoneNumber(value),
                    onChanged: (value) => validForm.setPhoneNumber(value),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _controller.email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Email Address",
              ),
              validator: (value) => validForm.setEmail(value),
              onChanged: (value) => validForm.setEmail(value),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Password",

                suffixIcon: IconButton(
                  icon: Icon(
                    _controller.obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.obscurePassword =
                          !_controller.obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _controller.obscurePassword,
              validator: (value) => validForm.setPassword(value),
              onChanged: (value) => validForm.setPassword(value),
              autocorrect: false,
            ),
            const SizedBox(height: 40),
            _controller.isLoading
                ? CircularProgressIndicator()
                : TButton(onPressed: _signUpUser, buttonTitle: "Sign Up"),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Log In",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
