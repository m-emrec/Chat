import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/onBoarding/data/datasources/firestore_connection.dart';
import 'package:chat_app/features/onBoarding/domain/repositories/onboarding_repo.dart';

class OnboardingRepoImpl implements OnboardingRepo {
  final FireBaseFirestoreConnection _firestoreConnection;

  OnboardingRepoImpl(this._firestoreConnection);
  @override
  Future<DataState> registerDataToFireStore() async {
    final DataState dataState =
        await _firestoreConnection.registerDataToFireStore();
    return dataState;
  }
}
