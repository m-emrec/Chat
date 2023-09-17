// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConnection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<DataState<UserModel>> fetchUserDataFromFireStore(String uid) async {
  //   try {

  //   } catch (e) {

  //   }
  // }

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
      return DataFailed(e);
    }
  }
}
