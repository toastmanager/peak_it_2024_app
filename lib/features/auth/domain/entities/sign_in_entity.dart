import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String phone;
  final String email;
  final String password;

  const SignInEntity(
      {required this.phone, required this.email, required this.password});

  SignInEntity copyWith({String? phone, String? email, String? password}) {
    return SignInEntity(
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignInEntity{phone=$phone, email=$email, password=$password}';
  }

  @override
  List<Object?> get props => [phone, email, password];
}
