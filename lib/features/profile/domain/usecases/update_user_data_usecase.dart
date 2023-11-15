import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/profile/domain/repositories/profile_repo.dart';

class UpdateUserDataUsecase extends UseCase<DataState, Map<Object, Object>> {
  final ProfileRepo _profileRepo;

  UpdateUserDataUsecase(this._profileRepo);

  @override
  Future<DataState> call(Map<Object, Object> newData) {
    return _profileRepo.updateUserData(newData: newData);
  }
}
