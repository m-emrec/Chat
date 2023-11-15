// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseFirestoreConnection {
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
  Future<DataState> registerDataToFireStore() async {
    final _auth = FirebaseAuth.instance;
    final User _user = _auth.currentUser!;
    final String email = _user.email!;
    final String uid = _user.uid;
    final String phone = _user.phoneNumber!;
    final String userName = _user.displayName!;
    final String? photoUrl = _user.photoURL;

    try {
      _firestore.collection("Users").doc(uid).set({
        "uid": uid,
        "name": userName,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
      });

      return DataSuccess(null);
    } catch (e) {
      logger.e(e.toString());
      return DataFailed(e);
    }
  }
}
