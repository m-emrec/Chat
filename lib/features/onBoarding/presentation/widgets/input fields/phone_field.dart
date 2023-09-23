import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/phone_text_field.dart';
import 'package:chat_app/features/onBoarding/presentation/bloc/onboarding_bloc.dart';
import 'package:chat_app/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/Buttons/text_button.dart';
import '../../../../../core/utils/text fields/normal_text_field.dart';
import '../../../../../logger.dart';
import '../animated_title.dart';

class PhoneField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  const PhoneField({
    super.key,
    required this.formKey,
    required this.phoneController,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late OnboardingBloc _onboardingBloc;

  @override
  void initState() {
    _onboardingBloc = sl<OnboardingBloc>();
    _onboardingBloc.add(WaitForNumberVerificationEvent());
    super.initState();
  }

  final TextEditingController _countryCodeController = TextEditingController();
  String _phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return AnimatedFrame(
      secondChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Text(
            "Your Phone Number",
            style: context.textHeme.titleLarge,
          ),

          /// Spacing
          32.ph,

          /// TextField
          PhoneTextField(
            controller: widget.phoneController,
            validator: (value) =>
                value!.isEmpty ? "Please enter a valid number." : null,
            hintText: "(xxx) xxx-xxx-xx",
            textInputType: TextInputType.phone,
            countryCodeController: _countryCodeController,
          ),
          16.ph,

          /// Send Vericification
          Align(
            alignment: Alignment.centerRight,
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              bloc: _onboardingBloc,
              builder: (context, state) {
                return ButtonText(
                  onTap: state is VerificationCodeSendedState
                      ? () {}
                      : () {
                          if (widget.formKey.currentState!.validate()) {
                            _phoneNumber = _countryCodeController.text +
                                widget.phoneController.text;
                            _onboardingBloc.add(
                                SendVerificationEvent(_phoneNumber, context));
                            //   ///
                          }
                        },
                  text: "Send Verification Code",
                  // size: 0.3,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
