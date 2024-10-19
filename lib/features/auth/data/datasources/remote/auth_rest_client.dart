import 'package:dio/dio.dart';
import 'package:peak_it_2024_app/features/auth/data/models/request_code_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/token_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/token_refresh_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/verify_code_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_rest_client.g.dart';

@RestApi()
abstract class AuthRestClient {
  factory AuthRestClient(Dio dio, {String? baseUrl}) = _AuthRestClient;

  @POST('/request_code')
  Future<void> requestCode(@Body() RequestCodeModel model);

  @POST('/verify_code')
  Future<TokenModel> verifyCode(@Body() VerifyCodeModel model);
  
  @POST('/refresh')
  Future<TokenModel> refreshToken(@Body() TokenRefreshModel model);
}
