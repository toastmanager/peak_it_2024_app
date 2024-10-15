import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_up_entity.dart';
part 'sing_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends Equatable {
  final String phone;
  final String email;
  final String password;

  const SignUpModel(
      {required this.phone, required this.email, required this.password});

  SignUpModel copyWith({String? phone, String? email, String? password}) {
    return SignUpModel(
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [phone, email, password];

  @override
  String toString() {
    return 'SignUpModel{phone=$phone, email=$email, password=$password}';
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  SignUpEntity toEntity() {
    return SignUpEntity(phone: phone, email: email, password: password);
  }

  factory SignUpModel.fromEntity(SignUpEntity entity) {
    return SignUpModel(
        phone: entity.phone, email: entity.email, password: entity.password);
  }
}
