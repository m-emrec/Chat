// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/datasources/firebase_connection.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final FirestoreConnection _firestoreConnection;

  UserRepoImpl(this._firestoreConnection);

  @override
  Future<DataState> forgetPassword({required String email}) async {
    final _auth = FirebaseAuth.instance;
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      return DataFailed(e.message);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> signIn(
      {required String email, required String password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    try {
      final _auth = FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState> signInwithGoogle() async {
    try {
      final _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? _gSign = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication _gAuth = await _gSign!.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: _gAuth.idToken,
        accessToken: _gAuth.accessToken,
      );
      await _auth.signInWithCredential(credential);
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
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
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      return DataFailed(e.message);
    } catch (e) {
      logger.e(e.toString());
      return DataFailed(e.toString());
    }

    return dataState;
  }

  @override
  Future<DataState<UserModel>> fetchUserData({required String uid}) {
    throw UnimplementedError();
  }
}
