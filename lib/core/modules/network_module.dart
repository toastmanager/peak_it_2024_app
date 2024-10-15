import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class NetworkErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Add JWT check
    super.onError(err, handler);
  }
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Add JWT check
    super.onRequest(options, handler);
  }
}


@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(NetworkErrorInterceptor());
}