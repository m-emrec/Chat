// ignore_for_file: unused_import, unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:chat_app/logger.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthBloc(this._forgetPasswordUseCase, this._googleSignInUseCase,
      this._signInUseCase, this._signUpUseCase)
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignInEvent>(onAuthSignInEvent);
    on<AuthSignUpEvent>(onAuthSignUpEvent);
    on<AuthSignInWithGoogleEvent>(onAuthSignInWithGoogleEvent);
    on<AuthForgetPasswordEvent>(onAuthForgetPasswordEvent);
  }

  FutureOr<void> onAuthSignInEvent(
      AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final DataState dataState =
          await _signInUseCase.call([event.email, event.password]);
      if (dataState is DataSuccess) {
        // emit()
      } else {
        emit(AuthFail(dataState.exception ?? "An unkown error occured ! "));
      }
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  FutureOr<void> onAuthSignUpEvent(
      AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final DataState dataState =
          await _signUpUseCase.call([event.email, event.password]);

      if (dataState is DataSuccess) {
        emit(AuthSuccess());
      } else {
        logger.e(dataState.exception);
        emit(AuthFail(dataState.exception ?? "An unkown error occured !"));
      }
    } catch (e) {
      logger.e(e);
      emit(AuthFail(e.toString()));
    }
  }

  FutureOr<void> onAuthSignInWithGoogleEvent(
      AuthSignInWithGoogleEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> onAuthForgetPasswordEvent(
      AuthForgetPasswordEvent event, Emitter<AuthState> emit) {}
}
