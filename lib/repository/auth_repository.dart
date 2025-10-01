import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  //  Variable
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //  Get AuthChange of User
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  // Get Authenticated User Data
  User? get authUser => _firebaseAuth.currentUser;

  AuthRepository();

  // - - - - - - - LOG IN USER IN FIREBASE - - - - - - -
  Future<UserCredential> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseException(e);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // - - - - - - - SIGN UP/REGISTER USER IN FIREBASE - - - - - - -
  Future<UserCredential> resgisterUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseException(e);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // - - - - - - - EMAIL VERIFICATION IN FIREBASE - - - - - - -
  Future<void> sendEmailLink() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw "Email verification failed: ${e.code}";
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // - - - - - - - LOG OUT USER IN FIREBASE - - - - - - -
  Future<void> signUserOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw "LogOut error: ${e.message}";
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  //   Firebase Auth Exception
  String _handleFirebaseException(FirebaseAuthException e) {
    print('Firebase Error Code: ${e.code}');
    print('Firebase Error Message: ${e.message}');
    if (e.code == "user-not-found") {
      return "User not found";
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided.';
    } else if (e.code == 'invalid-email') {
      return 'Invalid email address.';
    } else if (e.code == 'email-already-in-use') {
      return 'Email is already registered.';
    } else if (e.code == 'too-many-requests') {
      return 'Too many requests. Try again later.';
    } else if (e.code == 'weak-password') {
      return "Too many requests. Try again later.";
    } else if (e.code == 'network-request-failed') {
      return 'Network error. Please check your internet connection and try again.';
    } else if (e.code == 'invalid-credential') {
      return 'Invalid email or password. Please check your credentials.';
    }
    return 'Unexpected error occured.';
  }
}
