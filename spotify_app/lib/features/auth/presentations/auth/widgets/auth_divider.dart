import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Text(
          'Or',
          style: TextStyle(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
