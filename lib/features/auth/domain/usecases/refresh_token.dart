import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@singleton
class RefreshToken {
  final AuthRepository repository;

  const RefreshToken({required this.repository});

  Future<void> execute(TokenRefreshEntity entity) async =>
      await repository.refreshToken(entity);
}
