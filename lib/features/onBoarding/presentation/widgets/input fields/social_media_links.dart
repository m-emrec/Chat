import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaLinks extends StatefulWidget {
  const SocialMediaLinks({super.key});

  @override
  State<SocialMediaLinks> createState() => _SocialMediaLinksState();
}

class _SocialMediaLinksState extends State<SocialMediaLinks> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTextField(
          icon: FaIcon(
            FontAwesomeIcons.instagram,
            size: 48,
            color: Colors.pink.shade600,
          ),
          controller: _controller,
        ),
        16.ph,
        IconTextField(
          icon: FaIcon(
            FontAwesomeIcons.facebook,
            size: 48,
            color: Colors.lightBlue.shade800,
          ),
          controller: _controller,
        ),
        16.ph,
        IconTextField(
          icon: const FaIcon(
            FontAwesomeIcons.twitter,
            size: 48,
            color: Colors.lightBlue,
          ),
          controller: _controller,
        ),
        16.ph,
      ],
    );
  }
}
