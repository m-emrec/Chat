// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/extensions/context_extension.dart';
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
      child: SizedBox(
        width: context.screenSize.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.children ?? [],
        ),
      ),
    );
  }
}
