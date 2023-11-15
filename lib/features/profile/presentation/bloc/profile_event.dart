part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {}

class ProfileGetDataEvent extends ProfileEvent {}

////    Update Events
class ProfileUpdateDataEvent extends ProfileEvent {
  final UserModel data;

  const ProfileUpdateDataEvent(this.data);
}

class ProfileUpdateDisplayNameEvent extends ProfileEvent {
  final String newName;

  const ProfileUpdateDisplayNameEvent(this.newName);
}

class ProfileUpdateSocialMediaLinksEvent extends ProfileEvent {
  final List<String> newSocialMediaLinks;

  const ProfileUpdateSocialMediaLinksEvent(this.newSocialMediaLinks);
}

class ProfileUpdatePhoneNumberEvent extends ProfileEvent {
  final String newPhone;

  const ProfileUpdatePhoneNumberEvent(this.newPhone);
}

class ProfileUpdateEmailEvent extends ProfileEvent {
  final String newEmail;

  const ProfileUpdateEmailEvent(this.newEmail);
}

class ProfileUpdatePasswordEvent extends ProfileEvent {
  final String newPassword;

  const ProfileUpdatePasswordEvent(this.newPassword);
}

class ProfileSaveUpdateEvent extends ProfileEvent {}
/////////

class ProfileLogOutEvent extends ProfileEvent {}
