import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/app_bar.dart';
import 'package:chat_app/features/auth/presentation/widgets/form.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../logger.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = "/sign-in";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(
        text: "Sign In",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
            child: AuthForm(
          formKey: _formKey,
          children: [
            NormalTextField(
              labelText: "Email",
              controller: _nameController,
              hintText: "example@xxx.com",
              validator: (value) => value!.isEmpty ? "fuck" : null,
            ),
            32.ph,
            PasswordField(
              label: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.button,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      "Forget ?",
                      style: TextStyle(
                        color: AppColors.button,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              controller: _passwordController,
            ),
            32.ph,
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  logger.i("message");
                }
              },
              child: const Text("Sign In"),
            ),
          ],
        )),
      ),
    );
  }
}
