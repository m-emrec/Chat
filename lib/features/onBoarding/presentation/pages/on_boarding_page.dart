// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/animated_title.dart';

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

  changeIsFirstPage(bool newVal) {
    setState(() {
      _isFirstPage = newVal;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedFrame(
        secondChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Back Button
              Visibility(
                visible: !_isFirstPage,
                child: ButtonText(
                  onTap: () => _pageController.previousPage(
                    duration: _duration,
                    curve: _curve,
                  ),
                  text: "Back",
                  size: 0.45,
                  height: 40,
                ),
              ),

              /// Continue Button
              ResponsiveButton(
                size: 0.45,
                context: context,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: _curve,
                    );
                  }
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  style: context.textHeme.titleLarge!.copyWith(fontSize: 32),
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
  }
}
