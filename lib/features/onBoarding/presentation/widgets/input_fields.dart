// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';

import '../../../../core/utils/text fields/normal_text_field.dart';
import '../../../../logger.dart';
import 'animated_title.dart';

class InputFields extends StatefulWidget {
  final PageController pageController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final Function changeIsFirstPage;
  final GlobalKey<FormState> formKey;
  const InputFields({
    Key? key,
    required this.pageController,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.changeIsFirstPage,
    required this.formKey,
  }) : super(key: key);

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  void dispose() {
    widget.addressController.dispose();
    widget.nameController.dispose();
    widget.phoneController.dispose();
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        onPageChanged: (page) {
          /// if page index is equal to 0 set the [_isFirstPage] to true.
          if (page == 0) {
            widget.changeIsFirstPage(true);

            /// if page index is not equal to 0 set the [_isFirstPage] to false.
          } else {
            widget.changeIsFirstPage(false);
          }
        },
        children: [
          /// 1 - Name
          AnimatedFrame(
            secondChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "Tell Us Your Name",
                  style: context.textHeme.titleLarge,
                ),

                /// Spacing
                32.ph,

                /// TextField
                NormalTextField(
                  controller: widget.nameController,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter your name." : null,
                  hintText: "Enter your name.",
                ),
              ],
            ),
          ),

          /// 2 - Phone Number
          AnimatedFrame(
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
                NormalTextField(
                  controller: widget.phoneController,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a valid number." : null,
                  hintText: "Phone",
                ),
                8.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: ButtonText(
                    onTap: () {
                      if (widget.formKey.currentState!.validate()) {
                        ///
                        FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: widget.phoneController.text,
                            verificationCompleted: (_) {},
                            verificationFailed: (e) {
                              logger.e(e.message);
                            },
                            codeSent: (a, b) {
                              logger.i(a);
                              logger.i(b);
                            },
                            codeAutoRetrievalTimeout: (_) {});
                      }
                    },
                    text: "Skip for now.",
                    size: 0.3,
                  ),
                )
              ],
            ),
          ),

          ///
        ],
      ),
    );
  }
}
