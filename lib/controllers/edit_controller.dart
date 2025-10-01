import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/controllers/user_controller.dart';
import 'package:homer_app/repository/user_repository.dart';

class EditController {
  final TextEditingController changeFirstName = TextEditingController();
  final TextEditingController changeLastName = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  EditController();

  void dispose() {
    changeFirstName.dispose();
    changeLastName.dispose();
  }

  // Updating UI when user updates profile
  Future<void> updateUserName(BuildContext context, WidgetRef ref) async {
    try {
      //         Check If Form Is Valid
      if (!formKey.currentState!.validate()) {
        return;
      }
      //        Update First & Last Name in Firebase Firestore
      Map<String, dynamic> updateName = {
        "FirstName": changeFirstName.text.trim(),
        "LastName": changeLastName.text.trim(),
      };
      await _userRepository.updatingField(updateName);
      //      Update UserName in UI
      ref.read(userControllerProvider.notifier).updateField(updateName);

      //       Success
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Congratulations! Your name has been updated'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      //        Show error message
      final message = e.toString();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
      print(message);
    }
  }
}
