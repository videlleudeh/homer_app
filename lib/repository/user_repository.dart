import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homer_app/models/user.dart';
import 'package:homer_app/repository/auth_repository.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthRepository _authState = AuthRepository();

  UserRepository();

  // Store User Data to Firestore
  Future<void> storeUserData(UserModel userModel) async {
    try {
      await _firestore
          .collection("Users")
          .doc(userModel.uid)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw 'Failed to save user data: ${e.message}';
    } catch (e) {
      throw 'Failed to save user data. Please try again.';
    }
  }

  // Get User from firestore
  Future<UserModel?> getUserData() async {
    try {
      final documentSnapshot = await _firestore
          .collection("Users")
          .doc(_authState.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromJson(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw 'Failed to get user data: ${e.message}';
    } catch (e) {
      throw 'Failed to get user data. Please try again';
    }
  }

  //  Updating User Data in Firestore
  Future<UserModel?> updatingUserData(UserModel updatedUser) async {
    try {
      await _firestore
          .collection("Users")
          .doc(updatedUser.uid)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw 'Update failed: ${e.message}';
    } catch (e) {
      throw 'Failed to update user. Please try again';
    }
    return null;
  }

  //  Updating a field in Firestore
  Future<UserModel?> updatingField(Map<String, dynamic> json) async {
    try {
      await _firestore
          .collection("Users")
          .doc(_authState.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw 'Update failed: ${e.message}';
    } catch (e) {
      throw 'Failed to update field. Please try again';
    }
    return null;
  }

  //  Deleting & Reauthenticating User from FireStore
  Future<void> reauthenticateAndDelete(String password) async {
    try {
      User? user = _authState.authUser;
      if (user != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);

        await _firestore.collection("Users").doc(user.uid).delete();

        // Delete from Firebase Auth
        await user.delete();
      }
    } on FirebaseException catch (e) {
      throw 'Failed to Delete Account: ${e.message}';
    } catch (e) {
      throw 'Failed to delete account. Please try again';
    }
  }
}
