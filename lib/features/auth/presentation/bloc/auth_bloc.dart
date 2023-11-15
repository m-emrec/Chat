// ignore_for_file: unused_import, unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/domain/usecases/fetch_user_data.dart';
import 'package:chat_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:chat_app/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../injection_container.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final FetchUserDataUseCase _fetchUserDataUseCase;

  AuthBloc(this._forgetPasswordUseCase, this._googleSignInUseCase,
      this._signInUseCase, this._signUpUseCase, this._fetchUserDataUseCase)
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
      /// first call the [singInUseCase]
      await _signInUseCase
          .call([event.email, event.password]).then((dataState) async {
        logger.d(dataState);

        /// if [sign in] process is successful
        if (dataState is DataSuccess) {
          await initializeDependenciesAfterAuth();
          emit(AuthSuccess());
          // await Future.delayed(const Duration(milliseconds: 250));
        } else {
          /// if [sign in] is not successfull emit [AuthFail]
          emit(AuthFail(dataState.exception ?? "An unkown error occured ! "));
        }

        // return dataState;
      });
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      emit(AuthFail(e.code));
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
        await initializeDependenciesAfterAuth();

        emit(AuthSuccess());
      } else {
        logger.e(dataState.exception.toString());
        emit(AuthFail(dataState.exception.toString()));
      }
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      emit(AuthFail(e.code));
    } catch (e) {
      logger.e(e.toString());
      emit(AuthFail(e.toString()));
    }
  }

  FutureOr<void> onAuthSignInWithGoogleEvent(
      AuthSignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _googleSignInUseCase.call(null);
      // final GetIt sl = GetIt.instance;
      await initializeDependenciesAfterAuth();

      emit(AuthSuccess());
    } catch (e) {
      logger.e(e.toString());
      emit(AuthFail(e.toString()));
    }
  }

  FutureOr<void> onAuthForgetPasswordEvent(
      AuthForgetPasswordEvent event, Emitter<AuthState> emit) async {
    try {
      final dataState = await _forgetPasswordUseCase.call(event.email);
      if (dataState is DataSuccess) {
        // emit(AuthSuccess());
      } else {
        emit(AuthFail(dataState.exception ?? "Zn error occured !"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFail(e.message ?? "An error occured"));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }
}
