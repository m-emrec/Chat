import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/text_field.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class PhoneTextField extends CustomTextField {
  final TextEditingController countryCodeController;
  PhoneTextField({
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
    required this.countryCodeController,
    super.onChanged,
  });

  @override
  FormFieldBuilder<String> get builder => (_) => Row(
        children: [
          SizedBox(
            width: 50,
            child: DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
              ),
              trailingIcon: SizedBox(),
              width: 95,
              controller: countryCodeController,
              initialSelection: "+90",
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: "+90",
                  label: "+90",
                ),
                DropdownMenuEntry(
                  value: "+45",
                  label: "+45",
                ),
              ],
            ),
          ),
          Expanded(child: base),
        ],
      );
}
