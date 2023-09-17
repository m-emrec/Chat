import 'package:chat_app/core/resources/data_state.dart';

abstract class UserRepo {
  ///
  Future<DataState> signIn({
    String email,
    String password,
  });

  Future<DataState> signUp({
    String email,
    String password,
  });

  Future<DataState> forgetPassword({
    String email,
  });

  Future<DataState> signInwithGoogle();
}
