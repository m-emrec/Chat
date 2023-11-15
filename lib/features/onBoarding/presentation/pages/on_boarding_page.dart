// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/utils/snackbars/error_snack.dart';
import 'package:chat_app/core/utils/snackbars/info_snack.dart';
import 'package:chat_app/features/onBoarding/presentation/bloc/onboarding_bloc.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/dialog_box.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/animated_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/input_fields.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final PageController _pageController = PageController();
  final Duration _duration = const Duration(milliseconds: 750);
  final Curve _curve = Curves.easeInBack;
  bool _isFirstPage = true;
  late OnboardingBloc _onboardingBloc;
  changeIsFirstPage(bool newVal) {
    setState(() {
      _isFirstPage = newVal;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _onboardingBloc = sl<OnboardingBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      bloc: _onboardingBloc,
      listener: (context, state) {
        if (state is NumberVerifiedSuccessState) {
          Navigator.of(context).pushReplacementNamed("/");
        }
        if (state is NumberVerifiedFailState) {
          ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnack(
              text: state.exception,
            ),
          );
        }
        if (state is VerificationCodeSendedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const InfoSnack(
              text: "Vericification code sended to your phone.",
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: AnimatedFrame(
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! SignOut Button
                  AnimatedCrossFade(
                    firstChild: ButtonText(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      text: "Sign Out",
                      size: 0.45,
                      height: 40,
                    ),
                    //! Back Button
                    secondChild: ButtonText(
                      onTap: () => _pageController.previousPage(
                        duration: _duration,
                        curve: _curve,
                      ),
                      text: "Back",
                      size: 0.45,
                      height: 40,
                    ),
                    crossFadeState: _isFirstPage
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                  ),

                  /// Continue Button
                  BlocConsumer<OnboardingBloc, OnboardingState>(
                    bloc: _onboardingBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      logger.i(state);
                      return ResponsiveButton(
                        size: 0.45,
                        context: context,
                        onPressed: state is WaitingForVericificationState
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  logger.i(_nameController.text);
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: _curve,
                                  );
                                }
                              },
                        child: Text(state is WaitingForVericificationState
                            ? "Please Verify Your Number"
                            : "Continue"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Main Title
                  AnimatedFrame(
                    secondChild: Text(
                      "Let Us Know\nAbout You",
                      style:
                          context.textHeme.titleLarge!.copyWith(fontSize: 32),
                    ),
                  ),
                  InputFields(
                    pageController: _pageController,
                    nameController: _nameController,
                    addressController: _addressController,
                    phoneController: _phoneController,
                    changeIsFirstPage: changeIsFirstPage,
                    formKey: _formKey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
