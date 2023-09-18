import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:flutter/material.dart';

class Sand extends StatefulWidget {
  const Sand({super.key});

  @override
  State<Sand> createState() => _SandState();
}

class _SandState extends State<Sand> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return NormalTextField(
      controller: TextEditingController(),
      labelText: "asd",
    );
  }
}
