import 'package:fruits_hub/Core/services/data_base_service.dart';
import 'package:fruits_hub/Core/services/fire_store_service.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt<FirebaseAuthService>(), getIt<DataBaseService>()),
  );
}
