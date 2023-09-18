import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/animated_title.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Size _size;
  // @override
  // void didChangeDependencies() {
  //   _size = context.screenSize;
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    _size = context.screenSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // floatingActionButton: AnimatedFrame(
      //   secondChild: ResponsiveButton(
      //     screenSize: _size,
      //     onPressed: () {},
      //     child: const Text("Continue"),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            AnimatedFrame(
              secondChild: Text(
                "Let Us Know\nAbout You",
                style: context.textHeme.titleLarge!.copyWith(fontSize: 32),
              ),
            ),

            Expanded(
              child: AnimatedFrame(
                secondChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tell Us Your Name",
                      style: context.textHeme.titleLarge,
                    ),
                    16.ph,
                    NormalTextField(
                      controller: TextEditingController(),
                      labelText: "",
                      validator: (value) =>
                          value!.isEmpty ? "Please enter your name." : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
