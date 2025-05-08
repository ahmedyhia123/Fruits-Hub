import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Core/errors/excption.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      log('${e.toString()} : ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تحقق من اتصال الانترنت الخاص بك!');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا الايميل مستخدم بالفعل.');
      } else {
        throw CustomException(message: 'حدث غطأ ما يرجو المحاولة في وقت لاحق');
      }
    } catch (e) {
      throw CustomException(message: 'حدث غطأ ما يرجو المحاولة في وقت لاحق');
    }
  }

  Future<User> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: '.الرقم السري او البريد الالكتروني غير صحيح',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: '.الرقم السري او البريد الالكتروني غير صحيح',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تحقق من اتصال الانترنت الخاص بك!');
      } else {
        throw CustomException(message: 'حدث غطأ ما يرجو المحاولة في وقت لاحق');
      }
    }
  }

  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(credential);

    return user.user!;
  }

  Future<User> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }

  Future deleteUser() async {
    await _instance.currentUser?.delete();
    
  }
}
