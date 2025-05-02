import 'package:bloc/bloc.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this.authRepo) : super(SignupCubitInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupCubitLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (l) => emit(SignupCubitFailure(l.message)),
      (r) => emit(SignupCubitSuccess(r)),
    );
  }
}
