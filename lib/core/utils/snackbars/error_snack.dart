import 'package:chat_app/core/constants/error_messages.dart';
import 'package:chat_app/core/utils/snackbars/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class ErrorSnack extends CustomSnack {
  const ErrorSnack({
    super.key,
    super.content,
    super.text,
  });

  @override
  Widget get content => Text(
        ErrorMessages.messages[text] ?? text,
        style: style,
      );
  @override
  Color? get backgroundColor => Colors.red;
  @override
  Duration get duration => const Duration(seconds: 3);
}
