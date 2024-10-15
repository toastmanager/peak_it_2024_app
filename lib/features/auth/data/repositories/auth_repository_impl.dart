import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(SignInEntity entity) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(SignUpEntity entity) {
    // TODO: implement register
    throw UnimplementedError();
  }

}
