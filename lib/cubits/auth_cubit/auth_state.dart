part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String errMessage;
  LoginFailure(this.errMessage);
}

final class SignUpSuccess extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMessage;
  SignUpFailure(this.errMessage);
}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutFailure extends AuthState {
  final String errMessage;
  LogoutFailure(this.errMessage);
}
