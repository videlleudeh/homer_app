import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/provider/form_provider.dart';
import 'package:homer_app/controllers/login_controller.dart';
import 'package:homer_app/views/authentication/screens/signup.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';

class TLoginForm extends ConsumerStatefulWidget {
  const TLoginForm({super.key});

  @override
  ConsumerState<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends ConsumerState<TLoginForm> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _logInUser() async {
    setState(() {
      _controller.isLoading = true;
    });

    await _controller.logIN(context, ref);

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

              autocorrect: false,
            ),
            const SizedBox(height: 40),
            _controller.isLoading
                ? CircularProgressIndicator()
                : TButton(onPressed: _logInUser, buttonTitle: "Log In"),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                "Create an account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
