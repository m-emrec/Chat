part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

abstract class AuthActionState extends AuthState {
  const AuthActionState();
}

class AuthInitial extends AuthState {}

/// Action States
class AuthLoading extends AuthActionState {}

class AuthSuccess extends AuthActionState {}

class AuthFail extends AuthActionState {
  final String exception;

  const AuthFail(this.exception);
}
