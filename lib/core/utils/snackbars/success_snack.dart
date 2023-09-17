import 'package:chat_app/core/utils/snackbars/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class SuccessSnack extends CustomSnack {
  const SuccessSnack({super.key, super.text});

  @override
  Widget get content => Text(
        text ?? "",
        style: style,
      );
  @override
  Color? get backgroundColor => Colors.green.shade600;
}
