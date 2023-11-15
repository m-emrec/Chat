import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/form.dart';

import '../../../config/theme/theme.dart';

// ignore: must_be_immutable
class PasswordField extends CustomTextField {
  PasswordField({
    super.key,
    super.controller,
    super.hintText,
    super.label,
    super.labelText,
    super.validator,
    super.textInputAction,
  });
  bool _hidePassword = true;

  @override
  FormFieldBuilder<String> get builder => (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label ?? const SizedBox(),
            labelText == null
                ? const SizedBox()
                : Text(
                    labelText ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.button,
                    ),
                  ),
            4.ph,
            StatefulBuilder(
              builder: (context, setState) => TextFormField(
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller,
                textInputAction: textInputAction,

                /// Decoration
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.button,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),

                  /// Text Styles
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.black87,
                  ),
                  alignLabelWithHint: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelAlignment: FloatingLabelAlignment.start,

                  /// Suffix
                  suffix: SizedBox(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _hidePassword = !_hidePassword;
                      }),
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                obscureText: _hidePassword,
              ),
            ),
          ],
        );
      };
}
