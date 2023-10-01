// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/snackbars/success_snack.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/logger.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          decoration: BoxDecoration(
            /// Gradient
            gradient: LinearGradient(
              colors: [
                AppColors.cardColor.withOpacity(0.8),
                AppColors.cardColor.withOpacity(0.2),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),

            /// Radius
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),

          /// Bottom Sheet
          child: _bottomSheet(bottomInset),
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

  Widget _bottomSheet(double bottomInset) {
    double _velocity = 0;

    return BottomSheet(
      enableDrag: true,
      animationController: _animationController,
      backgroundColor: AppColors.scaffold.withOpacity(0.3),
      showDragHandle: true,
      onDragEnd: (details, {isClosing = true}) {
        logger.i(_animationController.value);
        _velocity = details.velocity.pixelsPerSecond.direction;
      },

      onClosing: () {
        logger.i("message");
        if (_velocity > 0) {
          Navigator.of(context).pop();
        }
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      /// Content
      builder: (context) => SingleChildScrollView(
        child: SizedBox(
          width: context.screenSize.width * 0.9,
          height: context.screenSize.height * 0.4 + bottomInset,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// Title
                Text(
                  "Forget Pasword",
                  style: context.textHeme.titleLarge,
                ),

                /// Email Field
                NormalTextField(
                  controller: _emailController,
                  labelText: "Email",
                  validator: emailValidator,
                  textInputType: TextInputType.emailAddress,
                ),

                /// Button
                ResponsiveButton(
                  context: context,
                  screenSize: context.screenSize,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sl<AuthBloc>().add(
                        AuthForgetPasswordEvent(_emailController.text),
                      );
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SuccessSnack(
                          text:
                              "Password reset email has been send to ${_emailController.text}",
                        ),
                      );
                    }
                  },
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
