import 'package:fpdart/fpdart.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/domain/repository/auth_respository.dart';

class UserSignUp implements UseCase<UserModel, SignUpParams> {
  final AuthRepository _authRespository;

  UserSignUp({
    required AuthRepository authRepository,
  }) : _authRespository = authRepository;

  @override
  Future<Either<Failure, UserModel>> call(SignUpParams params) async {
    return await _authRespository.signUpWithLoginAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
