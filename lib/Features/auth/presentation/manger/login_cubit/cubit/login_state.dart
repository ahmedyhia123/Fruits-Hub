part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginFaliuer extends LoginState {
    final String failure;
  LoginFaliuer(this.failure);
}
final class LoginSucsess extends LoginState {
  final UserEntity user;
  LoginSucsess(this.user);
}
