import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';

part 'token_refresh_model.g.dart';

@JsonSerializable()
class TokenRefreshModel extends Equatable {
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const TokenRefreshModel({required this.refreshToken});

  TokenRefreshModel copyWith({String? refreshToken}) {
    return TokenRefreshModel(refreshToken: refreshToken ?? this.refreshToken);
  }

  @override
  List<Object?> get props => [refreshToken];

  @override
  String toString() {
    return 'TokenRefreshModel{refreshToken=$refreshToken}';
  }

  Map<String, dynamic> toJson() => _$TokenRefreshModelToJson(this);

  factory TokenRefreshModel.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshModelFromJson(json);

  TokenRefreshEntity toEntity() =>
      TokenRefreshEntity(refreshToken: refreshToken);

  factory TokenRefreshModel.fromEntity(TokenRefreshEntity entity) =>
      TokenRefreshModel(refreshToken: entity.refreshToken);
}
