import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/user_profile_body_widgets/status_widget.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';

class ProfileBodyEdit extends StatefulWidget {
  const ProfileBodyEdit({super.key});

  @override
  State<ProfileBodyEdit> createState() => _ProfileBodyEditState();
}

class _ProfileBodyEditState extends State<ProfileBodyEdit> {
  final TextEditingController _emailController =
      TextEditingController(text: "m.emrec45@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "5550286812");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: context.screenSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: context.textHeme.labelLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: TextField(
                      controller: _emailController,
                    ),
                  ),
                ],
              ),

              //! Change password buttton [TextButton]
              // ButtonText(
              //   onTap: () {},
              //   text: "Change Password",
              //   size: 0.4,
              // ),

              16.ph,

              //!  phone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone",
                    style: context.textHeme.labelLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: TextField(
                      controller: _phoneController,
                    ),
                  ),
                ],
              ),
              16.ph,

              //! birthday
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birthday",
                    style: context.textHeme.labelLarge,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Text("29.06.1999"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
