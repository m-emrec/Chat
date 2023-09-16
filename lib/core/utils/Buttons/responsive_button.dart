// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/core/utils/Buttons/button.dart';

class ResponsiveButton extends CustomButton {
  final Size screenSize;
  const ResponsiveButton({
    super.key,
    required this.screenSize,
    required super.onPressed,
    required super.child,
  });

  @override
  ButtonStyle? get style => super.style!.copyWith(
        fixedSize: MaterialStatePropertyAll(
          Size(screenSize.width * 0.9, 40),
        ),
      );
}
