import 'package:spotify_app/common/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.uid,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['id'] ?? '',
      email: map['email'] ?? '',
    );
  }

  UserModel copWith({
    final String? uid,
    final String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }
}
