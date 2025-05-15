import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      name: user.name,
    );
  }

  factory UserModel.fromDataBase(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
