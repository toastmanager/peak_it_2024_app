import 'package:equatable/equatable.dart';

class TokenRefreshEntity extends Equatable {
  final String refreshToken;

  const TokenRefreshEntity({required this.refreshToken});

  TokenRefreshEntity copyWith({String? refreshToken}) {
    return TokenRefreshEntity(refreshToken: refreshToken ?? this.refreshToken);
  }

  @override
  List<Object?> get props => [refreshToken];

  @override
  String toString() {
    return 'TokenRefreshEntity{refreshToken=$refreshToken}';
  }
}
