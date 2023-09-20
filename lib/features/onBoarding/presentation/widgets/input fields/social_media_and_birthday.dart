import 'package:chat_app/features/onBoarding/presentation/widgets/animated_title.dart';
import 'package:chat_app/features/onBoarding/presentation/widgets/input%20fields/social_media_links.dart';
import 'package:flutter/material.dart';

class SocialMediaAndBirthDay extends StatefulWidget {
  const SocialMediaAndBirthDay({super.key});

  @override
  State<SocialMediaAndBirthDay> createState() => _SocialMediaAndBirthDayState();
}

class _SocialMediaAndBirthDayState extends State<SocialMediaAndBirthDay> {
  @override
  Widget build(BuildContext context) {
    return AnimatedFrame(
      secondChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaLinks(),
        ],
      ),
    );
  }
}
