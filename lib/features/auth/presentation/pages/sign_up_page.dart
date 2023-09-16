import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/app_bar.dart';
import 'package:chat_app/features/auth/presentation/widgets/form.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../logger.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = "/sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = context.screenSize;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(
        text: "Sign Up",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(
            formKey: _formKey,
            children: [
              NormalTextField(
                labelText: "Email",
                controller: _nameController,
                hintText: "example@xxx.com",
                validator: (value) => value!.isEmpty ? "fuck" : null,
                textInputType: TextInputType.emailAddress,
              ),
              32.ph,
              PasswordField(
                label: const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.button,
                  ),
                ),
                controller: _passwordController,
              ),
              32.ph,
              ResponsiveButton(
                screenSize: size,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    logger.i("message");
                  }
                },
                child: const Text("Sign Up"),
              ),
              32.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? "),
                  ButtonText(onTap: () {}, text: "Click here !")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
