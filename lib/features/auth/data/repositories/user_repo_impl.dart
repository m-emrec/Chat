// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/datasources/firebase_connection.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final FirestoreConnection _firestoreConnection;

  UserRepoImpl(this._firestoreConnection);

  @override
  Future<DataState> forgetPassword({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signIn(
      {required String email, required String password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    try {
      final _auth = FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return DataFailed(e);
    }
    return DataSuccess(null);
  }

  @override
  Future<DataState> signInwithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signUp(
      {required String email, required String password}) async {
    late DataState dataState;
    try {
      final _auth = FirebaseAuth.instance;
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      dataState = await _firestoreConnection.registerDataToFireStore(
        email: user.user!.email!,
        uid: user.user!.uid,
      );
    } catch (e) {
      return DataFailed(e);
    }

    return dataState;
  }

  @override
  Future<DataState<UserModel>> fetchUserData({required String uid}) {
    throw UnimplementedError();
  }
}
