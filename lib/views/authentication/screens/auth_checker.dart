import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homer_app/navigation.dart';
import 'package:homer_app/repository/auth_repository.dart';
import 'package:homer_app/views/authentication/screens/loading.dart';
import 'package:homer_app/views/authentication/screens/login.dart';
import 'package:homer_app/views/authentication/screens/verify_email.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          print("AuthChecker - Showing LoginScreen");
          return const LoginScreen();
        } else if (!user.emailVerified) {
          print("AuthChecker - Showing VerifyEmailScreen");
          return const VerifyEmailScreen();
        } else {
          print("AuthChecker - Showing HomeNav");
          // ref.read(bottomNavIndexProvider.notifier).state = 0;
          return const HomeNav();
        }
      },
      loading: () {
        return LoadingScreen();
      },
      error: (error, stack) {
        return LoginScreen();
      },
    );
  }
}
