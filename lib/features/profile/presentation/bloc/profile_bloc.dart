// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/profile/domain/usecases/update_user_data_usecase.dart';
import 'package:chat_app/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/usecases/feth_user_data_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserDataUsecase _fetchUserDataUseCase;
  final UpdateUserDataUsecase _updateUserDataUsecase;
  ProfileBloc(this._fetchUserDataUseCase, this._updateUserDataUsecase)
      : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ProfileGetDataEvent>(onProfileGetDataEvent);
    on<ProfileLogOutEvent>(onProfileLogOutEvent);
    on<ProfileUpdateDataEvent>(onProfileUpdateDataEvent);
    on<ProfileUpdateDisplayNameEvent>(onProfileUpdateDisplayNameEvent);
    on<ProfileUpdateEmailEvent>(onProfileUpdateEmailEvent);
    on<ProfileUpdatePhoneNumberEvent>(onProfileUpdatePhoneNumberEvent);
    on<ProfileUpdateSocialMediaLinksEvent>(
        onProfileUpdateSocialMediaLinksEvent);
    on<ProfileUpdatePasswordEvent>(onProfileUpdatePasswordEvent);
    on<ProfileSaveUpdateEvent>(onProfileSaveUpdateEvent);
  }

  FutureOr<void> onProfileGetDataEvent(
      ProfileGetDataEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      final DataState _dataState = await _fetchUserDataUseCase.call(null);

      if (_dataState is DataSuccess) {
        final UserModel _userData = UserModel.fromMap(_dataState.data);
        emit(ProfileLoadedSuccessState(_userData));
      } else {
        emit(ProfileLoadedFailState(
            _dataState.exception ?? "An error occured !"));
      }
    } catch (e) {
      logger.e(e);
      emit(ProfileLoadedFailState(e.toString()));
    }
  }

  FutureOr<void> onProfileLogOutEvent(
      ProfileLogOutEvent event, Emitter<ProfileState> emit) async {
    await FirebaseAuth.instance.signOut();
  }

  ///// Update

  FutureOr<void> onProfileUpdateDataEvent(
      ProfileUpdateDataEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileUpdateState(event.data));
  }

  /// Update Display Name
  FutureOr<void> onProfileUpdateDisplayNameEvent(
      ProfileUpdateDisplayNameEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileActionInitialState());

    try {
      /// update user display name
      await FirebaseAuth.instance.currentUser!.updateDisplayName(event.newName);

      /// Update FireStore
      final DataState _dataState =
          await _updateUserDataUsecase.call({"name": event.newName});

      if (_dataState is DataSuccess) {
        ///if update name successfull emit[SuccesState]
        emit(const ProfileUpdatedSuccessState("Display Name"));
      } else {
        /// if update naem is not succesfull emit[FailState]
        emit(ProfileUpdatedFailState(
            _dataState.exception ?? "An error occured !"));
      }
    } catch (e) {
      /// if an error occures emit[FailState]
      emit(ProfileUpdatedFailState(e.toString()));
    }
  }

  /// Update Email
  FutureOr<void> onProfileUpdateEmailEvent(
      ProfileUpdateEmailEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileActionInitialState());
    try {
      /// Update firestore
      final DataState _dataState = await FirebaseAuth.instance.currentUser!
          .updateEmail(event.newEmail)
          .then(
              (value) => _updateUserDataUsecase.call({"email": event.newEmail}))
          .timeout(
            const Duration(seconds: 3),
            onTimeout: () => DataFailed("exception"),
          );

      /// if update is successfull
      /// update FirebasAuth and emit[SuccessState]
      if (_dataState is DataSuccess) {
        emit(const ProfileUpdatedSuccessState("Email"));
      } else {
        logger.e(_dataState.exception);

        /// If there is an error  emit[FailState]
        emit(ProfileUpdatedFailState(
            _dataState.exception ?? "An error occrued !"));
      }
    } on FirebaseAuthException catch (e) {
      emit(ProfileUpdatedFailState(e.message ?? "An error occured !"));
    } catch (e) {
      logger.e(e);
      emit(ProfileUpdatedFailState(e.toString()));
    }
  }

  /// Update Phone Number
  FutureOr<void> onProfileUpdatePhoneNumberEvent(
      ProfileUpdatePhoneNumberEvent event, Emitter<ProfileState> emit) {
    // TODO : Update sl.
  }

  /// Update Social Media Links
  FutureOr<void> onProfileUpdateSocialMediaLinksEvent(
      ProfileUpdateSocialMediaLinksEvent event, Emitter<ProfileState> emit) {
    // TODO : Update sl.
  }

  /// Update Password
  FutureOr<void> onProfileUpdatePasswordEvent(
      ProfileUpdatePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileActionInitialState());
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(event.newPassword);
      emit(const ProfileUpdatedSuccessState("Password"));
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      emit(ProfileUpdatedFailState(e.message ?? "An errror occured !"));
    } catch (e) {
      logger.e(e);
      emit(ProfileUpdatedFailState(e.toString()));
    }
  }

  /// Save the Updates
  FutureOr<void> onProfileSaveUpdateEvent(
      ProfileSaveUpdateEvent event, Emitter<ProfileState> emit) {}
}
