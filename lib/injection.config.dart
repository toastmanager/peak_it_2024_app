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

import 'core/modules/network_module.dart' as _i401;
import 'features/auth/data/datasources/remote/auth_data_source_remote.dart'
    as _i526;
import 'features/auth/data/datasources/remote/auth_rest_client.dart' as _i475;
import 'features/auth/data/modules/auth_rest_client_module.dart' as _i533;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final authRestClientModule = _$AuthRestClientModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i475.AuthRestClient>(
        () => authRestClientModule.authRestClient);
    gh.singleton<_i526.AuthDataSourceRemote>(
        () => _i526.AuthDataSourceRemoteImpl());
    gh.singleton<_i1015.AuthRepository>(() => _i111.AuthRepositoryImpl());
    return this;
  }
}

class _$NetworkModule extends _i401.NetworkModule {}

class _$AuthRestClientModule extends _i533.AuthRestClientModule {}
