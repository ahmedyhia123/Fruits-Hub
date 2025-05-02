import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/errors/Failure.dart';
import 'package:fruits_hub/Core/errors/excption.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImpl(this._firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await _firebaseAuthService.caretUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'),
      );
    }
  }
}
