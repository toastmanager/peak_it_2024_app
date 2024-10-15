import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@singleton
class GetToken {
  final AuthRepository repository;

  const GetToken({required this.repository});

  Future<void> execute() async => await repository.getToken();
}