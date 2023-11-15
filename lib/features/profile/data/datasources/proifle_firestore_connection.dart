import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileFireStoreConnection {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<DataState> getDataFromFireStore() async {
    try {
      final Map<String, dynamic>? userDoc = await _fireStore
          .collection("Users")
          .doc(uid)
          .get()
          .then((value) => value.data());
      return DataSuccess(userDoc);
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }

  Future<DataState> updateDataFromFireStore(
      final Map<Object, Object> newData) async {
    try {
      await _fireStore.collection("Users").doc(uid).update(newData);

      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }
}
