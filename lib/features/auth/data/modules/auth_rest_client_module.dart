import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/data/datasources/remote/auth_rest_client.dart';

@module
abstract class AuthRestClientModule {
  
  @lazySingleton
  AuthRestClient get authRestClient => AuthRestClient(Dio());
}