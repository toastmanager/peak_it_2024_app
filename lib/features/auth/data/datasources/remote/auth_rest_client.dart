import 'package:dio/dio.dart';
import 'package:peak_it_2024_app/features/auth/data/models/sing_up_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:peak_it_2024_app/features/auth/data/models/sign_in_model.dart';

part 'auth_rest_client.g.dart';

@RestApi(baseUrl: 'localhost:8000/')
abstract class AuthRestClient {
  factory AuthRestClient(Dio dio, {String? baseUrl}) = _AuthRestClient;

  @POST('/auth/jwt/register')
  Future<void> register(@Body() SignUpModel model);
  @POST('/auth/jwt/login')
  Future<void> login(@Body() SignInModel model);
  @POST('/auth/jwt/logout')
  Future<void> logout();
}
