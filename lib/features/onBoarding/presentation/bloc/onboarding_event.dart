// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends OnboardingEvent {}

class WaitForNumberVerificationEvent extends OnboardingEvent {}

class SendVerificationEvent extends OnboardingEvent {
  final BuildContext context;
  final String phoneNumber;

  const SendVerificationEvent(this.phoneNumber, this.context);
}

class CheckVerificationCodeEvent extends OnboardingEvent {
  final String code;
  final String phone;
  final String id;

  const CheckVerificationCodeEvent(
    this.code,
    this.phone,
    this.id,
  );
}
