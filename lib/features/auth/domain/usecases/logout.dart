import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@singleton
class Logout {
  final AuthRepository repository;

  const Logout({required this.repository});

  Future<void> execute() async => await repository.logout();
}