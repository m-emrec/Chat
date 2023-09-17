part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFail extends AuthState {
  final String exception;

  const AuthFail(this.exception);
}

/// Action States
abstract class AuthAcitonState extends AuthState {}
