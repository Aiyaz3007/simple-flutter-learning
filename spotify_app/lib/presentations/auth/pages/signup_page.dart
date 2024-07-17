import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentations/auth/pages/signin_page.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_app_bar.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_divider.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_other_sign_in_ways.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_sign_in_button.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_text_field.dart';
import 'package:spotify_app/presentations/choose_mode/pages/choose_mode.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AuthAppBar(
          icons: Icons.arrow_back_ios_new,
          image: AppVectors.logo,
          iconButton: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChooseModePage(),
                ));
          },
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
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
              Container(
                child: const Column(
                  children: [
                    AuthTextField(name: "Full Name"),
                    SizedBox(height: 16),
                    AuthTextField(name: "Enter Email"),
                    SizedBox(height: 16),
                    AuthTextField(
                      name: "Password",
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const AuthSignInButton(
                text: "Register",
                height: 80,
                width: double.infinity,
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
                              MaterialPageRoute(
                                builder: (context) => const SigninPage(),
                              ));
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
          ),
        ),
        const Spacer(flex: 1)
      ],
    ));
  }
}