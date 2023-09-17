part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoadedSuccess extends AuthState {}

class AuthLoadedFail extends AuthState {}

/// Action States
abstract class AuthAcitonState extends AuthState {}
