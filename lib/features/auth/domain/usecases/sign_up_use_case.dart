import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';

class SignUpUseCase implements UseCase<DataState, List<String>> {
  final UserRepo _userRepo;

  SignUpUseCase(this._userRepo);
  @override
  Future<DataState> call(List<String> params) {
    return _userRepo.signUp(
      email: params[0],
      password: params[1],
    );
  }
}
