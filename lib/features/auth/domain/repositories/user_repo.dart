import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

abstract class UserRepo {
  ///
  Future<DataState> signIn({
    required String email,
    required String password,
  });

  Future<DataState> signUp({
    required String email,
    required String password,
  });

  Future<DataState> forgetPassword({
    required String email,
  });

  Future<DataState> signInwithGoogle();

  Future<DataState> fetchUserData({required String uid});
}
