import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/theme/app_theme.dart';
import 'package:spotify_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:spotify_app/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:spotify_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:spotify_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:spotify_app/features/auth/presentations/auth/bloc/auth_bloc.dart';
import 'package:spotify_app/features/auth/presentations/splash/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(
            userSignUp: UserSignUp(
                authRepository: AuthRepositoryImpl(
                    remoteDataSource:
                        AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth))),
            userSignIn: UserSignIn(
                authRespository: AuthRepositoryImpl(
                    remoteDataSource:
                        AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth)))),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashPage(),
    );
  }
}
