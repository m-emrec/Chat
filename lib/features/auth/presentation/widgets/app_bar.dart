import 'package:flutter/material.dart';

class AuthAppBar extends AppBar {
  final String text;
  AuthAppBar({
    required this.text,
    super.key,
  }) : super(title: Text(text));

  // AppBar(
  //       forceMaterialTransparency: true,
  //       title: Text(
  //         "Sign In",
  //         style: context.textHeme.titleLarge,
  //       ),
  //       centerTitle: true,
  //     ),
  @override
  bool get forceMaterialTransparency => true;
  @override
  bool? get centerTitle => true;
}
