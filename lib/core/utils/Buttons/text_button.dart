// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  const ButtonText({
    Key? key,
    required this.onTap,
    required this.text,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Text(
        widget.text,
        style: widget.style!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
