import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Core/services/data_base_service.dart';
import 'package:fruits_hub/Core/utils/backend_endpoints.dart';
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
      var userEntity = UserEntity(uid: user.uid, email: email, name: name);

      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await _firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await _firebaseAuthService.login(email, password);

      final userEntity = await readUserData(uid: user.uid);

      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      user = await _firebaseAuthService.loginWithGoogle();
      final UserEntity userEntity = UserEntity(
        uid: user.uid,
        email: user.email!,
        name: user.displayName!,
      );
      
      var isUserExist = await _dataBaseService.checkIfDataExists(
        uid: user.uid,
        collection: BackendEndpoints.usersCollection,
      );
      if (isUserExist){
        await readUserData(uid: user.uid);
      }else{
        await addUserData(user: userEntity);
      }

      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'account-exists-with-different-credential') {
        return const Left(
          ServerFailure('هذا الايميل مستخدم بالفعل قم بتسجيل الدخول'),
        );
      } else {
        return const Left(
          ServerFailure('حدث غطاء ما يرجو المحاولة في وقت لاحق'),
        );
      }
    } catch (e) {
      await deleteUser(user);
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await _firebaseAuthService.loginWithFacebook();
      final UserEntity userEntity = UserEntity(
        uid: user.uid,
        email: user.email!,
        name: user.displayName!,
      );
      var isUserExist = await _dataBaseService.checkIfDataExists(
        uid: user.uid,
        collection: BackendEndpoints.usersCollection,
      );
      if (isUserExist){
        await readUserData(uid: user.uid);
      }else{
        await addUserData(user: userEntity);
      }

      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'account-exists-with-different-credential') {
        return const Left(
          ServerFailure('هذا الايميل مستخدم بالفعل قم بتسجيل الدخول'),
        );
      } else {
        return const Left(
          ServerFailure('حدث غطاء ما يرجو المحاولة في وقت لاحق'),
        );
      }
    } catch (e) {
      await deleteUser(user);
      log(e.toString());
      return const Left(ServerFailure('حدث غطأ ما يرجو المحاولة في وقت لاحق'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await _dataBaseService.addData(
      collection: BackendEndpoints.usersCollection,
      data: user.toMap(),
      uid: user.uid,
    );
  }

  @override
  Future<UserEntity> readUserData({required String uid}) async {
    final user = await _dataBaseService.getData(
      uid: uid,
      collection: BackendEndpoints.usersCollection,
    );
    return UserModel.fromDataBase(user);
  }
}
