import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';

part 'request_code_model.g.dart';

@JsonSerializable()
class RequestCodeModel extends Equatable {
  final String phone;

  const RequestCodeModel({required this.phone});

  @override
  List<Object?> get props => [phone];

  @override
  String toString() {
    return 'RequestCodeModel{phone=$phone}';
  }

  RequestCodeEntity toEntity() => RequestCodeEntity(phone: phone);

  factory RequestCodeModel.fromEntity(RequestCodeEntity entity) =>
      RequestCodeModel(phone: entity.phone);

  RequestCodeModel copyWith({String? phone}) {
    return RequestCodeModel(phone: phone ?? this.phone);
  }

  Map<String, dynamic> toJson() => _$RequestCodeModelToJson(this);

  factory RequestCodeModel.fromJson(Map<String, dynamic> json) =>
      _$RequestCodeModelFromJson(json);
}
