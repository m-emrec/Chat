import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';

class ForgetPasswordUseCase implements UseCase<DataState, List<String>> {
  final UserRepo _userRepo;

  ForgetPasswordUseCase(this._userRepo);
  @override
  Future<DataState> call(List<String> params) {
    return _userRepo.forgetPassword(
      email: params[0],
    );
  }
}
