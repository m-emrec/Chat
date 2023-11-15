import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? uid,
    String? email,
    String? name,
    String? phoneNumber,
    String? photoUrl,
    List<String>? socialMediaLinks,
    DateTime? birthDay,
    String? status,
    List<String>? contacts,
  }) : super(
          birthDay: birthDay,
          contacts: contacts,
          email: email,
          status: status,
          name: name,
          phoneNumber: phoneNumber,
          socialMediaLinks: socialMediaLinks,
          photoUrl: photoUrl,
          uid: uid,
        );

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data["uid"],
      email: data["email"],
      birthDay: data["birthday"],
      contacts: data["contacts"],
      status: data["status"],
      name: data["name"],
      phoneNumber: data["phone"],
      socialMediaLinks: data["socialMediaLinks"],
      photoUrl: data["photoUrl"],
    );
  }
}
