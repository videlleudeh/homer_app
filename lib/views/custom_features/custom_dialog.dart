import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/controllers/user_controller.dart';
import 'package:homer_app/views/authentication/screens/login.dart';

class ShowDialog {
  static Future<void> confirmDeleteAccount(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final email = ref.read(userControllerProvider)?.email ?? "";

    final passwordController = TextEditingController();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (cntxt) => AlertDialog(
        title: Text("Delete Account"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter password for $email to confirm permanent delete:"),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref
            .read(userControllerProvider.notifier)
            .deleteAccountPermanently(email, passwordController.text);
        // Navigate out
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
