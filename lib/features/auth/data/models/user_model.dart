import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? uid,
    String? email,
    String? name,
    String? address,
    String? phoneNumber,
    List<String>? socialMediaLinks,
    DateTime? birthDay,
    bool? isOnline,
    List<String>? contacts,
  }) : super(
          address: address,
          birthDay: birthDay,
          contacts: contacts,
          email: email,
          isOnline: isOnline,
          name: name,
          phoneNumber: phoneNumber,
          socialMediaLinks: socialMediaLinks,
          uid: uid,
        );
}
