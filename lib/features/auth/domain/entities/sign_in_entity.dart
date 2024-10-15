import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String phone;
  final String password;

  const SignInEntity(
      {required this.phone, required this.password});

  SignInEntity copyWith({String? phone, String? email, String? password}) {
    return SignInEntity(
        phone: phone ?? this.phone,
        password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignInEntity{phone=$phone, password=$password}';
  }

  @override
  List<Object?> get props => [phone, password];
}
