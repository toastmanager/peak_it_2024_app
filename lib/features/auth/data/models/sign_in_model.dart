import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_in_entity.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends Equatable {
  final String phone;
  final String password;

  const SignInModel({required this.phone, required this.password});

  SignInEntity toEntity() {
    return SignInEntity(phone: phone, password: password);
  }

  SignInModel copyWith({String? phone, String? password}) {
    return SignInModel(
        phone: phone ?? this.phone, password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignInModel{phone=$phone, password=$password}';
  }

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  @override
  List<Object?> get props => [phone, password];
}
