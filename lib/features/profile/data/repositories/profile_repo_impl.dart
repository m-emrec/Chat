import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/profile/data/datasources/proifle_firestore_connection.dart';
import 'package:chat_app/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileFireStoreConnection _profileFireStoreConnection;

  ProfileRepoImpl(this._profileFireStoreConnection);

  @override
  Future<DataState> fetchUserData() {
    return _profileFireStoreConnection.getDataFromFireStore();
  }

  @override
  Future<DataState> updateUserData({required Map<Object, Object> newData}) {
    return _profileFireStoreConnection.updateDataFromFireStore(newData);
  }
}
