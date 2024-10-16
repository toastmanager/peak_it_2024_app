import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';

abstract class AuthRepository {
  Future<void> requestCode(RequestCodeEntity entity);
  Future<TokenEntity?> verifyCode(VerifyCodeEntity entity);
  Future<TokenEntity?> refreshToken(TokenRefreshEntity entity);
  Future<TokenEntity?> getToken();
  Future<void> logout();
}