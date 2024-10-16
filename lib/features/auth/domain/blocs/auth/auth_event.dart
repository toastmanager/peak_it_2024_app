part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRequestCode extends AuthEvent {
  final RequestCodeEntity entity;

  const AuthRequestCode({required this.entity});
}

class AuthVerifyCode extends AuthEvent {
  final VerifyCodeEntity entity;

  const AuthVerifyCode({required this.entity});
}

class AuthRefreshToken extends AuthEvent {}

class AuthGetToken extends AuthEvent {}

class AuthLogout extends AuthEvent {}
