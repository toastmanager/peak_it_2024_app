import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@singleton
class VerifyCode {
  final AuthRepository repository;

  const VerifyCode({required this.repository});

  Future<TokenEntity?> execute(VerifyCodeEntity entity) async => await repository.verifyCode(entity);
}