// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final double? size;
  final double? height;
  const ButtonText({
    Key? key,
    required this.onTap,
    required this.text,
    this.style = const TextStyle(),
    this.size,
    this.height,
  }) : super(key: key);

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 20,
      width:
          widget.size != null ? context.screenSize.width * widget.size! : null,
      child: InkWell(
        onTap: widget.onTap,
        child: Center(
          child: Text(
            widget.text,
            style: widget.style!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
