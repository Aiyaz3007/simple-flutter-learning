import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/utils/show_snackbar.dart';
import 'package:spotify_app/features/auth/presentations/auth/bloc/auth_bloc.dart';
import 'package:spotify_app/features/auth/presentations/auth/pages/home_page.dart';
import 'package:spotify_app/features/auth/presentations/auth/pages/signin_page.dart';
import 'package:spotify_app/features/auth/presentations/auth/pages/signup_or_signin_page.dart';
import 'package:spotify_app/features/auth/presentations/auth/widgets/auth_app_bar.dart';
import 'package:spotify_app/features/auth/presentations/auth/widgets/auth_divider.dart';
import 'package:spotify_app/features/auth/presentations/auth/widgets/auth_other_sign_in_ways.dart';
import 'package:spotify_app/features/auth/presentations/auth/widgets/auth_sign_in_button.dart';
import 'package:spotify_app/features/auth/presentations/auth/widgets/auth_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool showCircularProgressIndicator = false;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthAppBar(
              icons: Icons.arrow_back_ios_new,
              image: AppVectors.logo,
              iconButton: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupOrSigninPage(),
                    ));
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    return showSnackBar(
                        context: context, message: state.message);
                  }
                  if (state is AuthSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(userModel: state.userModel),
                        ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    showCircularProgressIndicator = true;
                  } else {
                    showCircularProgressIndicator = false;
                  }

                  return Column(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 22),
                          RichText(
                            text: const TextSpan(
                              text: 'If you need any support, ',
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w300,
                              ),
                              children: [
                                TextSpan(
                                  text: 'click here',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          AuthTextField(
                            name: "Full Name",
                            textEditingController: nameController,
                          ),
                          const SizedBox(height: 16),
                          AuthTextField(
                            name: "Enter Email",
                            textEditingController: emailController,
                          ),
                          const SizedBox(height: 16),
                          AuthTextField(
                            name: "Password",
                            isPassword: true,
                            textEditingController: passwordController,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      AuthSignInButton(
                        text: "Register",
                        height: 80,
                        width: double.infinity,
                        isLoadingEnable: showCircularProgressIndicator,
                        onTap: () {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 30),
                      const AuthDivider(),
                      const SizedBox(height: 40),
                      AuthOtherSignInWays(icons: const [
                        AppVectors.googleLogo,
                        AppVectors.appleLogo
                      ], onTapCallbacks: [
                        () {},
                        () {},
                      ]),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: 'Do You Have An Account ? ',
                          style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Now',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    SigninPage.route(),
                                  );
                                },
                              style: const TextStyle(
                                color: AppColors.navyBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
