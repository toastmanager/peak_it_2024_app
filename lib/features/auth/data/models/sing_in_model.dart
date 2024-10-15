import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_in_entity.dart';

part 'sing_in_model.g.dart';

@JsonSerializable()
class SignInModel extends Equatable {
  final String phone;
  final String email;
  final String password;

  const SignInModel(
      {required this.phone, required this.email, required this.password});

  @override
  List<Object?> get props => [phone, email, password];
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  @override
  String toString() {
    return 'SingInModel{phone=$phone, email=$email, password=$password}';
  }

  SignInModel copyWith({String? phone, String? email, String? password}) {
    return SignInModel(
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  SignInEntity toEntity() {
    return SignInEntity(phone: phone, email: email, password: password);
  }

  factory SignInModel.fromEntity(SignInEntity entity) {
    return SignInModel(
        phone: entity.phone, email: entity.email, password: entity.password);
  }
}
