import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/core/utils/snackbars/error_snack.dart';
import 'package:chat_app/core/utils/snackbars/success_snack.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/features/auth/presentation/widgets/app_bar.dart';
import 'package:chat_app/features/auth/presentation/widgets/form.dart';
import 'package:chat_app/injection_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/constants/error_messages.dart';
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
  late AuthBloc _authBloc;
  String? emailValidator(String? value) {
    if (EmailValidator.validate(value ?? "")) {
      return null;
    }
    return "Please provide a valid email address.";
  }

  String? passwordValidator(String? value) {
    if (value!.length >= 6) {
      return null;
    }
    return "Your password must be longer than 6 letters.";
  }

  @override
  void initState() {
    _authBloc = sl<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = context.screenSize;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(
        text: "Sign Up",
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacementNamed("/");
          }
          if (state is AuthFail) {
            logger.e(state.exception);
            ScaffoldMessenger.of(context).showSnackBar(
              ErrorSnack(
                text: state.exception,
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: AuthForm(
                formKey: _formKey,
                children: [
                  /// Email field
                  NormalTextField(
                    labelText: "Email",
                    controller: _nameController,
                    hintText: "example@xxx.com",
                    validator: emailValidator,
                    textInputType: TextInputType.emailAddress,
                  ),

                  /// Spacing
                  32.ph,

                  /// Password Field
                  PasswordField(
                    label: const Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.button,
                      ),
                    ),
                    validator: passwordValidator,
                    controller: _passwordController,
                  ),

                  /// Spacing
                  32.ph,

                  /// Sign Up Button
                  ResponsiveButton(
                    context: context,
                    screenSize: size,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sl<AuthBloc>().add(
                          AuthSignUpEvent(
                              email: _nameController.text,
                              password: _passwordController.text),
                        );
                      }
                    },
                    child: const Text("Sign Up"),
                  ),

                  /// Spacing
                  32.ph,

                  /// Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ? "),
                      ButtonText(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(SignInPage.routeName),
                          text: "Click here !")
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
