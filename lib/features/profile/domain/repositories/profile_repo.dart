import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';

abstract class ProfileRepo {
  /// gets data from firestore
  Future<DataState> fetchUserData();

  /// update users data
  Future<DataState> updateUserData({
    required Map<Object, Object> newData,
  });
}
