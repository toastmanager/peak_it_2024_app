import 'package:equatable/equatable.dart';

class VerifyCodeEntity extends Equatable {
  final String phone;
  final String code;

  const VerifyCodeEntity({required this.phone, required this.code});

  VerifyCodeEntity copyWith({String? phone, String? code}) {
    return VerifyCodeEntity(
        phone: phone ?? this.phone, code: code ?? this.code);
  }

  @override
  List<Object?> get props => [phone, code];

  @override
  String toString() {
    return 'VerifyCodeEntity{phone=$phone, code=$code}';
  }
}
