import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:peak_it_2024_app/injection.dart';

@singleton
class NetworkErrorInterceptor extends Interceptor {
  final AuthBloc authBloc;
  final AuthRepository repository;
  final Logger logger;

  NetworkErrorInterceptor(
      {required this.authBloc, required this.repository, required this.logger});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final state = authBloc.state;
    if (state is AuthAuthorized) {
      final decodedToken = JwtDecoder.decode(state.token.accessToken);
      if (decodedToken['exp'] < DateTime.now().millisecondsSinceEpoch ~/ 1000) {
        try {
          await repository.refreshToken(
              TokenRefreshEntity(refreshToken: state.token.refreshToken));
          authBloc.add(AuthGetToken());
        } catch (e) {
          logger.e(e);
          authBloc.add(AuthLogout());
          rethrow;
        }
      }
      options.headers['Authorization'] =
          '${state.token.tokenType} ${state.token.accessToken}';
    }
    return super.onRequest(options, handler);
  }
}

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio()..interceptors.add(sl<NetworkErrorInterceptor>());
}
