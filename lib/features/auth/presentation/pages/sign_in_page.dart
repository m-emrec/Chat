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
    final Size size = context.screenSize;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(
        text: "Sign In",
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
              ResponsiveButton(
                screenSize: size,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    logger.i("message");
                  }
                },
                child: const Text("Sign In"),
              ),
              32.ph,
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide.none,
                    ),
                  ),
                  side: const MaterialStatePropertyAll(BorderSide.none),
                  elevation: const MaterialStatePropertyAll(2),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.scaffold),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("icons-google".icon.toPng),
                      height: 24,
                      width: 24,
                    ),
                    32.pw,
                    const Text("Sign In with Google"),
                  ],
                ),
              ),
              32.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't you have an account ? "),
                  ButtonText(onTap: () {}, text: "Create one !")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
