part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthSignInEvent({
    required this.email,
    required this.password,
  });
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthSignUpEvent({
    required this.email,
    required this.password,
  });
}

class AuthForgetPasswordEvent extends AuthEvent {}

class AuthSignInWithGoogleEvent extends AuthEvent {}
