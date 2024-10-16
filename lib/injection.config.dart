// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/modules/logger_module.dart' as _i1019;
import 'core/modules/network_module.dart' as _i401;
import 'core/modules/shared_preferences_module.dart' as _i1007;
import 'core/routes/router.dart' as _i66;
import 'features/auth/data/datasources/remote/auth_data_source_remote.dart'
    as _i526;
import 'features/auth/data/datasources/remote/auth_rest_client.dart' as _i475;
import 'features/auth/data/modules/auth_rest_client_module.dart' as _i533;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/blocs/auth/auth_bloc.dart' as _i660;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;
import 'features/auth/domain/usecases/get_token.dart' as _i689;
import 'features/auth/domain/usecases/logout.dart' as _i80;
import 'features/auth/domain/usecases/refresh_token.dart' as _i694;
import 'features/auth/domain/usecases/request_code.dart' as _i476;
import 'features/auth/domain/usecases/verify_code.dart' as _i701;
import 'features/food/data/repositories/food_repository_impl.dart' as _i967;
import 'features/food/domain/blocs/cart/cart_bloc.dart' as _i622;
import 'features/food/domain/blocs/food/food_bloc.dart' as _i323;
import 'features/food/domain/repositories/food_repository.dart' as _i509;
import 'features/food/domain/usecases/get_categories.dart' as _i997;
import 'features/food/domain/usecases/order_food.dart' as _i44;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    final injectionModule = _$InjectionModule();
    final authRestClientModule = _$AuthRestClientModule();
    gh.factory<_i622.CartBloc>(() => _i622.CartBloc());
    gh.singleton<_i66.AppRouter>(() => _i66.AppRouter());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i475.AuthRestClient>(
        () => authRestClientModule.authRestClient);
    gh.singleton<_i509.FoodRepository>(() => _i967.FoodRepositoryImpl());
    gh.singleton<_i526.AuthDataSourceRemote>(
        () => _i526.AuthDataSourceRemoteImpl(
              client: gh<_i475.AuthRestClient>(),
              logger: gh<_i974.Logger>(),
              prefs: gh<_i460.SharedPreferences>(),
            ));
    gh.singleton<_i997.GetCategories>(
        () => _i997.GetCategories(repository: gh<_i509.FoodRepository>()));
    gh.singleton<_i44.OrderFood>(
        () => _i44.OrderFood(repository: gh<_i509.FoodRepository>()));
    gh.factory<_i323.FoodBloc>(() => _i323.FoodBloc(
          getCategories: gh<_i997.GetCategories>(),
          orderFood: gh<_i44.OrderFood>(),
          logger: gh<_i974.Logger>(),
        ));
    gh.singleton<_i1015.AuthRepository>(() => _i111.AuthRepositoryImpl(
          logger: gh<_i974.Logger>(),
          authDataSourceRemote: gh<_i526.AuthDataSourceRemote>(),
        ));
    gh.singleton<_i689.GetToken>(
        () => _i689.GetToken(repository: gh<_i1015.AuthRepository>()));
    gh.singleton<_i80.Logout>(
        () => _i80.Logout(repository: gh<_i1015.AuthRepository>()));
    gh.singleton<_i694.RefreshToken>(
        () => _i694.RefreshToken(repository: gh<_i1015.AuthRepository>()));
    gh.singleton<_i476.RequestCode>(
        () => _i476.RequestCode(repository: gh<_i1015.AuthRepository>()));
    gh.singleton<_i701.VerifyCode>(
        () => _i701.VerifyCode(repository: gh<_i1015.AuthRepository>()));
    gh.factory<_i660.AuthBloc>(() => _i660.AuthBloc(
          requestCode: gh<_i476.RequestCode>(),
          verifyCode: gh<_i701.VerifyCode>(),
          refreshToken: gh<_i694.RefreshToken>(),
          getToken: gh<_i689.GetToken>(),
          logout: gh<_i80.Logout>(),
        ));
    gh.singleton<_i401.NetworkErrorInterceptor>(
        () => _i401.NetworkErrorInterceptor(
              authBloc: gh<_i660.AuthBloc>(),
              repository: gh<_i1015.AuthRepository>(),
              logger: gh<_i974.Logger>(),
            ));
    return this;
  }
}

class _$LoggerModule extends _i1019.LoggerModule {}

class _$NetworkModule extends _i401.NetworkModule {}

class _$InjectionModule extends _i1007.InjectionModule {}

class _$AuthRestClientModule extends _i533.AuthRestClientModule {}
