import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/profile/domain/repositories/profile_repo.dart';

class FetchUserDataUsecase extends UseCase<DataState, void> {
  final ProfileRepo _profileRepo;

  FetchUserDataUsecase(this._profileRepo);
  @override
  Future<DataState> call(void params) {
    return _profileRepo.fetchUserData();
  }
}
