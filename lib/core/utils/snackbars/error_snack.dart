import 'package:chat_app/core/utils/snackbars/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class ErrorSnack extends CustomSnack {
  final String error;
  const ErrorSnack({
    super.key,
    super.content,
    required this.error,
  });

  @override
  Widget get content => Text(error);
  @override
  Color? get backgroundColor => Colors.red;
  @override
  Duration get duration => const Duration(seconds: 3);
}
