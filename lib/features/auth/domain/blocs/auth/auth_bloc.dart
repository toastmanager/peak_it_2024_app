import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/token_refresh_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/usecases/get_token.dart';
import 'package:peak_it_2024_app/features/auth/domain/usecases/refresh_token.dart';
import 'package:peak_it_2024_app/features/auth/domain/usecases/request_code.dart';
import 'package:peak_it_2024_app/features/auth/domain/usecases/verify_code.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RequestCode requestCode;
  final VerifyCode verifyCode;
  final RefreshToken refreshToken;
  final GetToken getToken;

  TokenEntity blocToken =
      const TokenEntity(accessToken: "", refreshToken: "", tokenType: "bearer");

  AuthBloc(
      {required this.requestCode,
      required this.verifyCode,
      required this.refreshToken,
      required this.getToken})
      : super(AuthInitial()) {
    on<AuthRequestCode>(_onRequestCode);
    on<AuthVerifyCode>(_onVerifyCode);
    on<AuthRefreshToken>(_onRefreshToken);
    on<AuthGetToken>(_onGetToken);
  }

  Future<void> _onRequestCode(
      AuthRequestCode event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await requestCode.execute(event.entity);
      emit(AuthCodeRequested());
    } catch (e) {
      emit(AuthCodeInvalid());
      rethrow;
    }
  }

  Future<void> _onVerifyCode(
      AuthVerifyCode event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await verifyCode.execute(event.entity);
      if (token != null) {
        emit(AuthAuthorized(token: token));
        blocToken = token;
      } else {
        emit(AuthUnauthorized());
      }
    } catch (e) {
      emit(AuthUnauthorized());
      rethrow;
    }
  }

  Future<void> _onRefreshToken(
      AuthRefreshToken event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await refreshToken
          .execute(TokenRefreshEntity(refreshToken: blocToken.refreshToken));
      if (token != null) {
        emit(AuthAuthorized(token: token));
        blocToken = token;
      } else {
        emit(AuthUnauthorized());
      }
    } catch (e) {
      emit(AuthUnauthorized());
      rethrow;
    }
  }

  Future<void> _onGetToken(AuthGetToken event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await getToken.execute();
      if (token != null) {
        emit(AuthAuthorized(token: token));
        blocToken = token;
      } else {
        emit(AuthUnauthorized());
      }
    } catch (e) {
      emit(AuthUnauthorized());
      rethrow;
    }
  }
}
