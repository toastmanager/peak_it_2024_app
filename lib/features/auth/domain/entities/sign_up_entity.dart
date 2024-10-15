import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String phone;
  final String password;

  const SignUpEntity(
      {required this.phone, required this.password});

  SignUpEntity copyWith({String? phone, String? email, String? password}) {
    return SignUpEntity(
        phone: phone ?? this.phone,
        password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignUpEntity{phone=$phone, password=$password}';
  }

  @override
  List<Object?> get props => [phone, password];
}
