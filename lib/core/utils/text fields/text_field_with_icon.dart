import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../config/theme/theme.dart';

class IconTextField extends CustomTextField {
  final Widget icon;
  IconTextField({
    super.key,
    required super.controller,
    super.validator,
    super.hintText,
    super.label,
    super.labelText,
    super.textInputAction,
    super.textInputType,
    super.autofocus,
    super.autovalidateMode,
    super.textCapitalization,
    required this.icon,
  });

  @override
  Widget get base => Column(
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
          TextFormField(
            validator: validator,
            autovalidateMode: super.autovalidateMode,
            controller: controller,
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
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black87,
              ),
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: icon,
              ),
              // prefixIconColor: Colors.red,
            ),
            expands: expands ?? false,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            autofocus: autofocus ?? false,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            maxLines: null,
          ),
        ],
      );
}
