import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_up_entity.dart';
part 'sing_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends Equatable {
  final String phone;
  final String password;

  const SignUpModel(
      {required this.phone, required this.password});

  SignUpModel copyWith({String? phone, String? email, String? password}) {
    return SignUpModel(
        phone: phone ?? this.phone,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [phone, password];

  @override
  String toString() {
    return 'SignUpModel{phone=$phone, password=$password}';
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  SignUpEntity toEntity() {
    return SignUpEntity(phone: phone, password: password);
  }

  factory SignUpModel.fromEntity(SignUpEntity entity) {
    return SignUpModel(
        phone: entity.phone, password: entity.password);
  }
}
