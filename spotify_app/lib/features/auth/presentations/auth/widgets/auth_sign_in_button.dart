import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AuthSignInButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final bool isLoadingEnable;
  final String text;

  const AuthSignInButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    this.isLoadingEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.center,
          child: isLoadingEnable
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
        ),
      ),
    );
  }
}
