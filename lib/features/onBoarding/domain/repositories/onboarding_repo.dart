import 'package:chat_app/core/resources/data_state.dart';

abstract class OnboardingRepo {
  Future<DataState> registerDataToFireStore();
}
