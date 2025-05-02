part of 'signup_cubit_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class SignupCubitSuccess extends SignupCubitState {
  final UserEntity user;
  SignupCubitSuccess(this.user);
}

final class SignupCubitFailure extends SignupCubitState {
  final String failure;
  SignupCubitFailure(this.failure);
}

final class SignupCubitLoading extends SignupCubitState {}
