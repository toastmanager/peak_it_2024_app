import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String phone;
  final String email;
  final String password;

  const SignUpEntity(
      {required this.phone, required this.email, required this.password});

  SignUpEntity copyWith({String? phone, String? email, String? password}) {
    return SignUpEntity(
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignUpEntity{phone=$phone, email=$email, password=$password}';
  }

  @override
  List<Object?> get props => [phone, email, password];
}
