import 'package:fpdart/fpdart.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserModel>> signUpWithLoginAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signInWithLoginAndPassword({
    required String email,
    required String password,
  });
}
