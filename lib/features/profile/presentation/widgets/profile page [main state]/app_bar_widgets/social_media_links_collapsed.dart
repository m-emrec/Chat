import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaLinksCollapsed extends StatefulWidget {
  const SocialMediaLinksCollapsed({super.key});

  @override
  State<SocialMediaLinksCollapsed> createState() =>
      _SocialMediaLinksCollapsedState();
}

class _SocialMediaLinksCollapsedState extends State<SocialMediaLinksCollapsed> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // ! insta
        FaIcon(
          FontAwesomeIcons.instagram,
          size: 32,
          color: Colors.deepPurple.shade100,
        ),
        8.pw,

        //! twitter
        FaIcon(
          FontAwesomeIcons.twitter,
          size: 32,
          color: Colors.blue.shade700,
        ),
        8.pw,
        //! facebook
        FaIcon(
          FontAwesomeIcons.facebook,
          size: 32,
          color: Colors.blue.shade700,
        ),
        8.pw,
        // ! See more Button
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.button.withOpacity(0.9),
            ),
          ),
          // ! Icon
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: AppColors.button,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
