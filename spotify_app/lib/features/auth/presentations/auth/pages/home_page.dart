import 'package:flutter/material.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel userModel;
  const HomePage({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(userModel.email),
      ),
    );
  }
}
