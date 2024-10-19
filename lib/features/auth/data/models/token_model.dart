import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_entity.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Equatable{
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "token_type")
  final String tokenType;

  const TokenModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType});

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  TokenEntity toEntity() => TokenEntity(
      accessToken: accessToken,
      tokenType: tokenType,
      refreshToken: refreshToken);

  factory TokenModel.fromEntity(TokenEntity entity) => TokenModel(
      accessToken: entity.accessToken,
      tokenType: entity.tokenType,
      refreshToken: entity.refreshToken);
  TokenModel copyWith(
      {String? accessToken, String? refreshToken, String? tokenType}) {
    return TokenModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenType: tokenType ?? this.tokenType);
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, tokenType];

  @override
  String toString() {
    return 'TokenModel{accessToken=$accessToken, refreshToken=$refreshToken, tokenType=$tokenType}';
  }
}
