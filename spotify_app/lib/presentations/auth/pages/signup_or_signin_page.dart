import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_image.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentations/auth/pages/signin_page.dart';
import 'package:spotify_app/presentations/auth/pages/signup_page.dart';
import 'package:spotify_app/presentations/auth/widgets/auth_app_bar.dart';
import 'package:spotify_app/presentations/choose_mode/pages/choose_mode.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthAppBar(
            icons: Icons.arrow_back_ios_new,
            iconButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseModePage(),
                  ));
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImage.authBG),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  SvgPicture.asset(
                    AppVectors.logo,
                    height: 90,
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    "Enjoy listening to music",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ));
                        },
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninPage(),
                              ));
                        },
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColors.darkBackground,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
