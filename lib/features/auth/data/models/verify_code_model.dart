import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';

part 'verify_code_model.g.dart';

@JsonSerializable()
class VerifyCodeModel extends Equatable {
  final String phone;
  final String code;

  const VerifyCodeModel({required this.phone, required this.code});

  VerifyCodeModel copyWith({String? phone, String? code}) {
    return VerifyCodeModel(phone: phone ?? this.phone, code: code ?? this.code);
  }

  @override
  List<Object?> get props => [phone, code];

  @override
  String toString() {
    return 'VerifyCodeEntity{phone=$phone, code=$code}';
  }

  VerifyCodeEntity toEntity() => VerifyCodeEntity(phone: phone, code: code);

  factory VerifyCodeModel.fromEntity(VerifyCodeEntity entity) =>
      VerifyCodeModel(phone: entity.phone, code: entity.code);

  Map<String, dynamic> toJson() => _$VerifyCodeModelToJson(this);

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeModelFromJson(json);
}
