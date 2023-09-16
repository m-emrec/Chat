// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final List<Widget>? children;
  const AuthForm({
    Key? key,
    this.formKey,
    this.children,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.children ?? [],
      ),
    );
  }
}
