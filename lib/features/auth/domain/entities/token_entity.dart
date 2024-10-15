import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  const TokenEntity(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType});

  TokenEntity copyWith(
      {String? accessToken, String? refreshToken, String? tokenType}) {
    return TokenEntity(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenType: tokenType ?? this.tokenType);
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, tokenType];

  @override
  String toString() {
    return 'TokenEntity{accessToken=$accessToken, refreshToken=$refreshToken, tokenType=$tokenType}';
  }
}
