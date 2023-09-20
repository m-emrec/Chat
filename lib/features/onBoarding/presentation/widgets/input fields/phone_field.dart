import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/phone_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/Buttons/text_button.dart';
import '../../../../../core/utils/text fields/normal_text_field.dart';
import '../../../../../logger.dart';
import '../animated_title.dart';

class PhoneField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  const PhoneField({
    super.key,
    required this.formKey,
    required this.phoneController,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final TextEditingController _countryCodeController = TextEditingController();
  String _phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return AnimatedFrame(
      secondChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Text(
            "Your Phone Number",
            style: context.textHeme.titleLarge,
          ),

          /// Spacing
          32.ph,

          /// TextField
          PhoneTextField(
            controller: widget.phoneController,
            validator: (value) =>
                value!.isEmpty ? "Please enter a valid number." : null,
            hintText: "(xxx) xxx-xxx-xx",
            textInputType: TextInputType.phone,
            countryCodeController: _countryCodeController,
          ),
          8.ph,

          /// Skip for now.
          Align(
            alignment: Alignment.centerRight,
            child: ButtonText(
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  _phoneNumber =
                      _countryCodeController.text + widget.phoneController.text;

                  //   ///
                  //   FirebaseAuth.instance.verifyPhoneNumber(
                  //       phoneNumber: widget.phoneController.text,
                  //       verificationCompleted: (_) {
                  //         logger.i("Complete");
                  //       },
                  //       verificationFailed: (e) {
                  //         logger.e(e.message);
                  //       },
                  //       codeSent: (id, code) {
                  //         logger.i(code);
                  //         showDialog(
                  //             context: context,
                  //             builder: (_) {
                  //               final TextEditingController _c =
                  //                   TextEditingController();
                  //               return AlertDialog(
                  //                 content: TextField(
                  //                   controller: _c,
                  //                 ),
                  //                 actions: [
                  //                   ButtonText(
                  //                       onTap: () {
                  //                         final _cre =
                  //                             PhoneAuthProvider.credential(
                  //                                 verificationId: id,
                  //                                 smsCode: _c.text);
                  //                         logger.i(_cre);
                  //                       },
                  //                       text: "Done")
                  //                 ],
                  //               );
                  //             });
                  //       },
                  //       codeAutoRetrievalTimeout: (_) {});
                }
              },
              text: "Send Verification Code.",
              size: 0.3,
            ),
          )
        ],
      ),
    );
  }
}
