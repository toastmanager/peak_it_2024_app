import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:peak_it_2024_app/features/auth/data/datasources/constants.dart';
import 'package:peak_it_2024_app/features/auth/data/datasources/remote/auth_rest_client.dart';
import 'package:peak_it_2024_app/features/auth/data/models/request_code_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/token_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/token_refresh_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/verify_code_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSourceRemote {
  Future<void> requestCode(RequestCodeModel model);
  Future<TokenModel?> verifyCode(VerifyCodeModel model);
  Future<TokenModel?> refreshToken(TokenRefreshModel model);
  Future<TokenModel?> getToken();
  Future<void> logout();
}

@Singleton(as: AuthDataSourceRemote)
class AuthDataSourceRemoteImpl implements AuthDataSourceRemote {
  final AuthRestClient client;
  final Logger logger;
  final SharedPreferences prefs;

  const AuthDataSourceRemoteImpl(
      {required this.client, required this.logger, required this.prefs});

  Future<bool> saveToken(TokenModel model) async {
    return await prefs.setString(
        AuthConsts.prefsTokenKey, json.encode(model.toJson()));
  }

  @override
  Future<void> requestCode(RequestCodeModel model) async {
    try {
      final res = await client.requestCode(model);
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<TokenModel> verifyCode(VerifyCodeModel model) async {
    try {
      final res = await client.verifyCode(model);
      logger.i('Successfully verified code');
      await saveToken(res);
      logger.i('Successfully saved tokens');
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<TokenModel?> getToken() async {
    try {
      final tokenMap = prefs.getString(AuthConsts.prefsTokenKey);
      if (tokenMap == null) {
        return null;
      }
      return TokenModel.fromJson(json.decode(tokenMap));
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<TokenModel?> refreshToken(TokenRefreshModel model) async {
    try {
      final res = await client.refreshToken(model);
      logger.i('Successfully refreshed tokens');
      await saveToken(res);
      logger.i('Successfully saved tokens');
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
  
  @override
  Future<void> logout() async {
    try {
      await saveToken(const TokenModel(accessToken: "", refreshToken: "", tokenType: "bearer"));
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
