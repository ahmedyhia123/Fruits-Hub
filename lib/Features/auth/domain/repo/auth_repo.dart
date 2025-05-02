import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/errors/Failure.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  // Future<Either<Failure, User>> login(String email, String password);
  // Future<Either<Failure, User>> loginWithGoogle();
  // Future<Either<Failure, User>> loginWithFacebook();
  // Future<Either<Failure, User>> register(String email, String password, String name);
  // Future<Either<Failure, User>> logout();
  // Future<Either<Failure, User>> resetPassword(String email);
}
