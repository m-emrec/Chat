part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedSuccessState extends ProfileState {
  final UserModel data;

  const ProfileLoadedSuccessState(this.data);
}

class ProfileLoadedFailState extends ProfileState {
  final String error;

  const ProfileLoadedFailState(this.error);
}

class ProfileUpdateState extends ProfileState {
  final UserModel data;

  const ProfileUpdateState(this.data);
}
//// Action States

abstract class ProfileActionState extends ProfileState {
  const ProfileActionState();
}

class ProfileActionInitialState extends ProfileActionState {}

class ProfileUpdatedFailState extends ProfileActionState {
  final String errorMesg;

  const ProfileUpdatedFailState(this.errorMesg);
}

class ProfileUpdatedSuccessState extends ProfileActionState {
  final String tag;
  const ProfileUpdatedSuccessState(this.tag);
}
