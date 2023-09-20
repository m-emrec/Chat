import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/text fields/normal_text_field.dart';
import '../animated_title.dart';

class NameField extends StatefulWidget {
  final TextEditingController nameController;
  const NameField({super.key, required this.nameController});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return AnimatedFrame(
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
            textCapitalization: TextCapitalization.words,
            autofocus: true,
            autovalidateMode: AutovalidateMode.disabled,
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}
