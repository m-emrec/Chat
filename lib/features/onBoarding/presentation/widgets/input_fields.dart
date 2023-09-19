// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/features/onBoarding/presentation/widgets/input%20fields/name_field.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/input%20fields/phone_field.dart';
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
        physics:
            const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
          NameField(
            nameController: widget.nameController,
          ),

          /// 2 - Phone Number
          PhoneField(
            formKey: widget.formKey,
            phoneController: widget.phoneController,
          ),

          ///
        ],
      ),
    );
  }
}
