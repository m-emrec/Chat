// ignore_for_file: no_leading_underscores_for_local_identifiers, argument_type_not_assignable_to_error_handler

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/constants/error_messages.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/onBoarding/domain/usecases/register_data_to_firestore_usecase.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/Buttons/text_button.dart';
import '../widgets/dialog_box.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final RegisterDataToFireStoreUsecase _registerDataToFireStoreUseCase;

  OnboardingBloc(
    this._registerDataToFireStoreUseCase,
  ) : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});
    on<InitialEvent>(onInitialEvent);
    on<WaitForNumberVerificationEvent>(onWaitForNumberVerificationEvent);
    on<SendVerificationEvent>(onSendVerificationEvent);
    on<CheckVerificationCodeEvent>(onCheckVerificationCodeEvent);
  }
  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingInitial());
  }

  FutureOr<void> onWaitForNumberVerificationEvent(
      WaitForNumberVerificationEvent event, Emitter<OnboardingState> emit) {
    emit(WaitingForVericificationState());
  }

  FutureOr<void> onSendVerificationEvent(
      SendVerificationEvent event, Emitter<OnboardingState> emit) async {
    emit(const VerificationCodeSendedState());

    final _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          logger.e(e);
          emit(NumberVerifiedFailState(e.code));
        },
        codeSent: (id, token) {
          showDialog(
            context: event.context,
            builder: (_) => DialogBox(
              phone: event.phoneNumber,
              vericificationId: id,
              name: event.name,
            ),
          );
        },
        codeAutoRetrievalTimeout: (e) {
          emit(NumberVerifiedFailState(e));
        });
  }

  FutureOr<void> onCheckVerificationCodeEvent(
      CheckVerificationCodeEvent event, Emitter<OnboardingState> emit) async {
    final _auth = FirebaseAuth.instance;

    emit(const VerificationCodeSendedState());
    logger.i(event.code);
    try {
      /// take the credentials
      final _credential = PhoneAuthProvider.credential(
        verificationId: event.id,
        smsCode: event.code,
      );

      /// if the user enters the correct code update user's phone number
      await _auth.currentUser!
          .updatePhoneNumber(_credential)
          .onError((FirebaseAuthException error, stackTrace) {
        logger.e(error);
        emit(
          NumberVerifiedFailState(error.code),
        );
      });
      await _auth.currentUser!.updateDisplayName(event.name);
      await _registerDataToFireStoreUseCase.call(null);

      // sl.registerSingleton<UserModel>(UserModel.fromMap(_auth.currentUser!.))

      emit(NumberVerifiedSuccessState());
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      // emit(NumberVerifiedFailState(e.code));
    } catch (e) {
      logger.e(e);
      // emit(NumberVerifiedFailState(e.toString()));
    }
  }
}
