// ignore_for_file: no_leading_underscores_for_local_identifiers, argument_type_not_assignable_to_error_handler

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/constants/error_messages.dart';
import 'package:chat_app/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/Buttons/text_button.dart';
import '../widgets/dialog_box.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
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
          emit(NumberVerifiedFailState(e.code));
        },
        codeSent: (id, token) {
          showDialog(
            context: event.context,
            builder: (_) => DialogBox(
              phone: event.phoneNumber,
              vericificationId: id,
            ),
          );
        },
        codeAutoRetrievalTimeout: (e) {
          emit(NumberVerifiedFailState(e));
        });
    // await _auth.verifyPhoneNumber(
    //     phoneNumber: event.phoneNumber,
    //     verificationCompleted: (_) {},
    //     verificationFailed: (e) {
    //       logger.e(e.message);
    //       emit(NumberVerifiedFailState(e.code));
    //     },
    //     codeSent: (verificationId, code) {
    //       try {
    //         final TextEditingController _controller = TextEditingController();
    //         showDialog(
    //           context: event.context,
    //           builder: (_) => DialogBox(
    //             onTap: () async {
    //               logger.i("message");

    //               /// take the credentials
    //               final _credential = PhoneAuthProvider.credential(
    //                 verificationId: verificationId,
    //                 smsCode: _controller.text,
    //               );
    //               logger.i(_auth.currentUser);

    //               /// if the user enters the correct code update user's phone number
    //               await _auth.currentUser!
    //                   .updatePhoneNumber(_credential)
    //                   .onError((FirebaseAuthException error, stackTrace) {
    //                 logger.e(error);
    //                 // emit(
    //                 //   NumberVerifiedFailState(error.code),
    //                 // );
    //               });
    //             },
    //           ),
    //           barrierDismissible: false,
    //         );
    //       } on FirebaseAuthException catch (e) {
    //         logger.e(e.message);
    //         // emit(NumberVerifiedFailState(e.code));
    //       } catch (e) {
    //         logger.e(e);
    //         // emit(NumberVerifiedFailState(e.toString()));
    //       }
    //     },
    //     codeAutoRetrievalTimeout: (_) {
    //       emit(WaitingForVericificationState());
    //     });
  }

  FutureOr<void> onCheckVerificationCodeEvent(
      CheckVerificationCodeEvent event, Emitter<OnboardingState> emit) async {
    final _auth = FirebaseAuth.instance;
    emit(const VerificationCodeSendedState());

    try {
      /// take the credentials
      final _credential = PhoneAuthProvider.credential(
        verificationId: event.id,
        smsCode: event.code,
      );
      logger.i(_auth.currentUser);

      /// if the user enters the correct code update user's phone number
      await _auth.currentUser!
          .updatePhoneNumber(_credential)
          .onError((FirebaseAuthException error, stackTrace) {
        logger.e(error);
        emit(
          NumberVerifiedFailState(error.code),
        );
      });
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      // emit(NumberVerifiedFailState(e.code));
    } catch (e) {
      logger.e(e);
      // emit(NumberVerifiedFailState(e.toString()));
    }
  }
}
