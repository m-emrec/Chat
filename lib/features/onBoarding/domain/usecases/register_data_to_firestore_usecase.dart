import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/use_case.dart';
import 'package:chat_app/features/onBoarding/domain/repositories/onboarding_repo.dart';

class RegisterDataToFireStoreUsecase implements UseCase<DataState<void>, void> {
  final OnboardingRepo _onboardingRepo;

  RegisterDataToFireStoreUsecase(this._onboardingRepo);

  @override
  Future<DataState<void>> call(void param) async {
    return await _onboardingRepo.registerDataToFireStore();
  }
}
