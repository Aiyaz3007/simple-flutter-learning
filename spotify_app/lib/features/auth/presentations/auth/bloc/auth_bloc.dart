import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:spotify_app/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignUp>(
      (event, emit) async {
        emit(AuthLoading());

        final res = await _userSignUp(
          SignUpParams(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );

        res.fold(
          (l) => emit(AuthFailure(message: l.message)),
          (r) => emit(AuthSuccess(userModel: r)),
        );
      },
    );
    on<AuthSignIn>(
      (event, emit) async {
        final res = await _userSignIn(SignInParams(
          email: event.email,
          password: event.password,
        ));

        res.fold(
          (l) => emit(AuthFailure(message: l.message)),
          (r) => emit(AuthSuccess(userModel: r)),
        );
      },
    );
  }
}
