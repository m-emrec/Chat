// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';

// class SignInUseCase  {
//   final UserRepo _userRepo;
//   SignInUseCase(
//     this._userRepo,
//   );

//   Future<DataState> call({
//     required String email,
//     required String password,
//   }) {
//     return _userRepo.signIn(email: email, password: password);
//   }
// }

class SignInUseCase implements UseCase<DataState, List> {
  final UserRepo _userRepo;
  SignInUseCase(
    this._userRepo,
  );

  @override
  Future<DataState> call(params) {
    return _userRepo.signIn(
      email: params[0],
      password: params[1],
    );
  }
}
