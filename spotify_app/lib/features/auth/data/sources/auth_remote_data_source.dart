import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/core/errors/exceptions.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithLoginAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithLoginAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> signInWithLoginAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (res.user == null) {
        throw ServerException(message: "User Not Found");
      }
      return UserModel(
        uid: res.user!.uid,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'invalid-credential':
          errorMessage =
              'Invalid credentials. Please check your email and password.';
          break;
        default:
          errorMessage = 'An undefined error occurred.';
      }
      throw ServerException(message: errorMessage);
    }
  }

  @override
  Future<UserModel> signUpWithLoginAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (res.user == null) {
        throw ServerException(message: "User Not Created!");
      }
      return UserModel(
        uid: res.user!.uid,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'invalid-credential':
          errorMessage =
              'Invalid credentials. Please check your email and password.';
          break;
        default:
          errorMessage = 'An undefined error occurred.';
      }
      throw ServerException(message: errorMessage);
    }
  }
}
