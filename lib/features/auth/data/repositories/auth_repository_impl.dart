import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:peak_it_2024_app/features/auth/data/datasources/remote/auth_data_source_remote.dart';
import 'package:peak_it_2024_app/features/auth/data/models/request_code_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/token_refresh_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/verify_code_model.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Logger logger;
  final AuthDataSourceRemote authDataSourceRemote;

  const AuthRepositoryImpl({
    required this.logger,
    required this.authDataSourceRemote,
  });

  @override
  Future<void> requestCode(RequestCodeEntity entity) async {
    return await authDataSourceRemote
        .requestCode(RequestCodeModel.fromEntity(entity));
  }

  @override
  Future<TokenEntity?> verifyCode(VerifyCodeEntity entity) async {
    final tokenModel = await authDataSourceRemote
        .verifyCode(VerifyCodeModel.fromEntity(entity));
    return tokenModel?.toEntity();
  }

  @override
  Future<TokenEntity?> getToken() async {
    final tokenModel = await authDataSourceRemote.getToken();
    return tokenModel?.toEntity();
  }

  @override
  Future<TokenEntity?> refreshToken(TokenRefreshEntity entity) async {
    final tokenModel = await authDataSourceRemote
        .refreshToken(TokenRefreshModel.fromEntity(entity));
    return tokenModel?.toEntity();
  }
}
