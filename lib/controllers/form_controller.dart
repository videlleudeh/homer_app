import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/formstate.dart';

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier() : super(FormState());

  String? setFirstName(String? value) {
    if (value!.trim().isEmpty) {
      return "First name required";
    }
    state = state.copyWith(firstName: value);
    return null;
  }

  String? setLastName(String? value) {
    if (value!.trim().isEmpty) {
      return "Last name required";
    }
    state = state.copyWith(lastName: value);
    return null;
  }

  String? setUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Username required";
    } else if (value.length < 5) {
      return "Username must be at least 5 characters";
    }
    state = state.copyWith(userName: value);
    return null;
  }

  String? setPhoneNumber(String? value) {
    if (value!.trim().isEmpty) {
      return "Phone Number required";
    } else if (value.length < 10) {
      return "Invalid phone number(Must be 11 digits)";
    }
    state = state.copyWith(phoneNumber: value);
    return null;
  }

  String? setEmail(String? value) {
    // Regular expressions for email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value!.trim().isEmpty) {
      return "Email required";
    } else if (!emailRegex.hasMatch(value)) {
      return "Email is invalid";
    }
    state = state.copyWith(email: value);
    return null;
  }

  String? setPassword(String? value) {
    // Regular expressions for password
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
    if (value!.trim().isEmpty) {
      return "Password required";
    } else if (!passwordRegex.hasMatch(value)) {
      return "Password must be 8+ chars, contain at least one uppercase, lowercase and number.";
    }
    state = state.copyWith(password: value);
    return null;
  }
}

final signUpFormProvider = StateNotifierProvider<FormNotifier, FormState>((
  ref,
) {
  return FormNotifier();
});
