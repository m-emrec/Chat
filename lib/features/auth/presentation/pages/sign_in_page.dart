import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:chat_app/features/auth/presentation/widgets/app_bar.dart';
import 'package:chat_app/features/auth/presentation/widgets/forget_password.dart';
import 'package:chat_app/features/auth/presentation/widgets/form.dart';
import 'package:chat_app/injection_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  late AuthBloc _authBloc;
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
        text: "Sign In",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.of(context).pushReplacementNamed("/");
              }
            },
            listenWhen: (previous, current) => current is AuthActionState,
            builder: (context, state) {
              return AuthForm(
                formKey: _formKey,
                children: [
                  /// Email field
                  NormalTextField(
                    labelText: "Email",
                    controller: _nameController,
                    hintText: "example@xxx.com",
                    textInputType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),

                  /// Spacing
                  32.ph,

                  /// Password Field
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

                        /// Forget button
                        GestureDetector(
                          child: const Text(
                            "Forget ?",
                            style: TextStyle(
                              color: AppColors.button,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          onTap: () => showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => const ForgetPassword(),
                          ),
                        ),
                      ],
                    ),
                    controller: _passwordController,
                  ),

                  /// Spacing
                  32.ph,

                  /// Sign In Button
                  ResponsiveButton(
                    screenSize: size,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sl<AuthBloc>().add(
                          AuthSignInEvent(
                              email: _nameController.text,
                              password: _passwordController.text),
                        );
                      }
                    },
                    child: const Text("Sign In"),
                  ),

                  /// Spacing
                  32.ph,

                  /// Sign in with google
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
                    onPressed: () =>
                        sl<AuthBloc>().add(AuthSignInWithGoogleEvent()),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("icons-google".icon.toPng),
                          height: 24,
                          width: 24,
                        ),
                        32.pw,
                        const Text(
                          "Sign In with Google",
                          style: TextStyle(
                            color: AppColors.button,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Spacing
                  32.ph,

                  /// Don't you have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't you have an account ? "),
                      ButtonText(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(SignUpPage.routeName),
                        text: "Create one !",
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String? emailValidator(String? value) {
    if (EmailValidator.validate(value ?? "")) {
      return null;
    }
    return "Please provide a valid email address.";
  }
}
