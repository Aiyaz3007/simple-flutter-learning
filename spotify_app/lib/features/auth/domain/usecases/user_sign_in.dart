import 'package:fpdart/fpdart.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/domain/repository/auth_respository.dart';

class UserSignIn implements UseCase<UserModel, SignInParams> {
  final AuthRepository _authRespository;

  UserSignIn({
    required AuthRepository authRespository,
  }) : _authRespository = authRespository;

  @override
  Future<Either<Failure, UserModel>> call(SignInParams params) async {
    return await _authRespository.signInWithLoginAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
