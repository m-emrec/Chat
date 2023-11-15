import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';

import '../entities/user_entity.dart';

class FetchUserDataUseCase implements UseCase<DataState<void>, String> {
  final UserRepo _userRepo;

  FetchUserDataUseCase(this._userRepo);
  @override
  Future<DataState> call(String uid) async {
    return await _userRepo.fetchUserData(uid: uid);
  }
}
