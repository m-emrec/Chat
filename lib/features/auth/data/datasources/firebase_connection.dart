// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConnection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DataState> fetchUserDataFromFireStore(String uid) async {
    try {
      DocumentSnapshot _user =
          await _firestore.collection("Users").doc(uid).get();

      logger.i(_user.data());

      return DataSuccess(_user.data());
    } catch (e) {
      return DataFailed(e);
    }
  }

  /// This function registers the data to Firestore database .
  Future<DataState> registerDataToFireStore(
      {required String uid, required String email}) async {
    final _user = UserModel(
      email: email,
      uid: uid,
    );
    try {
      _firestore.collection("Users").doc(uid).set({
        "uid": _user.uid,
        "email": _user.email,
      });
      return DataSuccess(null);
    } catch (e) {
      logger.e(e.toString());
      return DataFailed(e);
    }
  }
}
