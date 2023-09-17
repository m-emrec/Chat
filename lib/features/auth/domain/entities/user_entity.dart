// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String? email;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final List<String>? socialMediaLinks;
  final DateTime? birthDay;
  final bool? isOnline;
  final List<String>? contacts;

  UserEntity({
    this.email,
    this.name,
    this.address,
    this.phoneNumber,
    this.socialMediaLinks,
    this.birthDay,
    this.isOnline,
    this.contacts,
  });
}
