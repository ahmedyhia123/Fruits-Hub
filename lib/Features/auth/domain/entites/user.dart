class UserEntity {
  final String name;
  final String email;
  final String uid;

  UserEntity({required this.uid, required this.email, required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
