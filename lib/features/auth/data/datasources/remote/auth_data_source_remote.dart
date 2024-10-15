import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/auth/data/models/sign_in_model.dart';
import 'package:peak_it_2024_app/features/auth/data/models/sing_up_model.dart';

abstract class AuthDataSourceRemote {
  Future<void> signIn(SignInModel model);
  Future<void> signUp(SignUpModel model);
}

@Singleton(as: AuthDataSourceRemote)
class AuthDataSourceRemoteImpl implements AuthDataSourceRemote {
  @override
  Future<void> signIn(SignInModel model) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(SignUpModel model) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
}