part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthUnauthorized extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCodeRequested extends AuthState {}

final class AuthCodeExpired extends AuthState {}

final class AuthCodeInvalid extends AuthState {}

final class AuthAuthorized extends AuthState {
  final TokenEntity token;

  const AuthAuthorized({required this.token});
}
