import 'package:fpdart/fpdart.dart';
import 'package:spotify_app/core/errors/exceptions.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:spotify_app/features/auth/domain/repository/auth_respository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, UserModel>> signInWithLoginAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _remoteDataSource.signInWithLoginAndPassword(
        email: email,
        password: password,
      );

      return right(userModel);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithLoginAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _remoteDataSource.signUpWithLoginAndPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(userModel);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
