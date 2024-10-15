import 'package:peak_it_2024_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<void> login(SignInEntity entity);
  Future<void> register(SignUpEntity entity);
  Future<void> logout();
}