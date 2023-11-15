// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String? uid;
  final String? email;
  final String? name;
  final String? photoUrl;

  final String? phoneNumber;
  final List<String>? socialMediaLinks;
  final DateTime? birthDay;
  final String? status;

  /// TODO:Change this to [Contacts]
  final List<String>? contacts;

  UserEntity({
    this.uid,
    this.email,
    this.name,
    this.phoneNumber,
    this.socialMediaLinks,
    this.birthDay,
    this.status,
    this.contacts,
    this.photoUrl,
  });
}
