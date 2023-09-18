// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/core/utils/Buttons/button.dart';

class ResponsiveButton extends CustomButton {
  final Size? screenSize;
  final double? size;
  final BuildContext context;
  const ResponsiveButton({
    super.key,
    this.screenSize,
    required super.onPressed,
    required super.child,
    this.size,
    required this.context,
  });

  @override
  ButtonStyle? get style => super.style!.copyWith(
        fixedSize: MaterialStatePropertyAll(
          Size(context.screenSize.width * (size ?? 0.9), 40),
        ),
      );
}
