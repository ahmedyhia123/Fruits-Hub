import 'package:bloc/bloc.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.login(email, password);

    result.fold(
      (l) => emit(LoginFaliuer(l.message)),
      (r) => emit(LoginSucsess(r)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();

    result.fold(
      (l) => emit(LoginFaliuer(l.message)),
      (r) => emit(LoginSucsess(r)),
    );
  }
  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();

    result.fold(
      (l) => emit(LoginFaliuer(l.message)),
      (r) => emit(LoginSucsess(r)),
    );
  }
}
