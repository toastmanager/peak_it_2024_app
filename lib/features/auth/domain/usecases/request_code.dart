import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';

@singleton
class RequestCode {
  final AuthRepository repository;

  const RequestCode({required this.repository});

  Future<void> execute(RequestCodeEntity entity) async => await repository.requestCode(entity);
}