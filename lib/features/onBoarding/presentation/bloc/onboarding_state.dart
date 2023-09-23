part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class WaitingForVericificationState extends OnboardingState {}

class VerificationCodeSendedState extends OnboardingState {
  const VerificationCodeSendedState();
}

class NumberVerifiedSuccessState extends OnboardingState {}

class NumberVerifiedFailState extends OnboardingState {
  final String exception;

  const NumberVerifiedFailState(this.exception);
}
