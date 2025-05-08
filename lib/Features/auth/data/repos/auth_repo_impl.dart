import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Core/services/data_base_service.dart';
import 'package:fruits_hub/Core/utils/backend_endpoints.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/errors/Failure.dart';
import 'package:fruits_hub/Core/errors/excption.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  final DataBaseService _dataBaseService;

  AuthRepoImpl(this._firebaseAuthService, this._dataBaseService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;

    try {
      user = await _firebaseAuthService.caretUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);

      userEntity.name = name;
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await _firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await _firebaseAuthService.deleteUser();
      }
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await _firebaseAuthService.login(email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await _firebaseAuthService.loginWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await _firebaseAuthService.loginWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await _dataBaseService.addData(
      collection: BackendEndpoints.usersCollection,
      data: user.toMap(),
    );
  }
}
