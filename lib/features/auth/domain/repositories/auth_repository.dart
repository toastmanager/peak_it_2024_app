import 'package:peak_it_2024_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<void> signIn(SignInEntity entity);
  Future<void> signUp(SignUpEntity entity);
}