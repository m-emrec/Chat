import 'dart:ui';

import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
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

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
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
    return BottomSheet(
      animationController: _animationController,
      backgroundColor: AppColors.scaffold.withOpacity(0.3),
      showDragHandle: true,
      onClosing: () {},
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
                screenSize: context.screenSize,
                onPressed: () {
                  sl<AuthBloc>().add(
                    AuthForgetPasswordEvent(_emailController.text),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
