import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Core/errors/excption.dart';

class FirebaseAuthService {
  static final FirebaseAuth _instance =
      FirebaseAuth.instance; // FirebaseAuth _instance

  Future<User> caretUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'هذا الايميل مستخدم بالفعل.',
        );
      } else {
        throw CustomException(
          message: 'حدث غطأ ما يرجو المحاولة في وقت لاحق',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'حدث غطأ ما يرجو المحاولة في وقت لاحق',
      );
    }
  }
}
