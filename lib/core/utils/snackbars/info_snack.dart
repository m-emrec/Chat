import 'package:chat_app/core/utils/snackbars/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class InfoSnack extends CustomSnack {
  const InfoSnack({
    super.key,
    super.content,
    super.text,
  });
  @override
  Widget get content => Text(
        text ?? "",
        style: style,
      );
  @override
  Color? get backgroundColor => Colors.blue;
}
