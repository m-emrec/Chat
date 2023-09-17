// ignore: file_names
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';

class GoogleSignInUseCase implements UseCase<DataState, void> {
  final UserRepo _userRepo;

  GoogleSignInUseCase(this._userRepo);
  @override
  Future<DataState> call(void params) {
    return _userRepo.signInwithGoogle();
  }
}
