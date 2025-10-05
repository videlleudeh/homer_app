import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/user.dart';
import 'package:homer_app/provider/nav_index_provider.dart';
import 'package:homer_app/repository/auth_repository.dart';
import 'package:homer_app/repository/user_repository.dart';

class UserController extends StateNotifier<UserModel?> {
  final UserRepository _userRepository;
  final AuthRepository _authState = AuthRepository();
  UserController(this._userRepository) : super(null);

  //  Load User Data
  Future<void> loadUserData() async {
    try {
      final user = await _userRepository.getUserData();
      state = user ?? UserModel.empty();
    } catch (e) {
      state = UserModel.empty();
      print('Error loading user: $e');
    }
  }

  Future<void> updateField(Map<String, dynamic> fieldData) async {
    try {
      await _userRepository.updatingField(fieldData);
      await loadUserData();
    } catch (e) {
      print('Error updating field: $e');
      throw e.toString();
    }
  }

  // Log Out User
  Future<void> logout(BuildContext context, WidgetRef ref) async {
    try {
      await _authState.signUserOut();
      ref.read(bottomNavIndexProvider.notifier).state = 0;
      state = null;
    } catch (e) {
      print('Error logging out: $e');
      throw e.toString();
    }
  }

  // Delete Account
  Future<void> deleteAccountPermanently(String email, String password) async {
    try {
      await _userRepository.reauthenticateAndDelete(password);
      state = null;
    } catch (e) {
      print('Error deleting account: $e');
      throw e.toString();
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userControllerProvider =
    StateNotifierProvider<UserController, UserModel?>((ref) {
      final userRepo = ref.read(userRepositoryProvider);
      return UserController(userRepo);
    });
