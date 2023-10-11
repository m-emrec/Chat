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
        const FaIcon(
          FontAwesomeIcons.instagram,
          size: 32,
        ),
        8.pw,
        const FaIcon(
          FontAwesomeIcons.twitter,
          size: 32,
        ),
        8.pw,
        const FaIcon(
          FontAwesomeIcons.facebook,
          size: 32,
        ),
        8.pw,
        // * See more Button
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.button.withOpacity(0.8),
            ),
          ),
          // * Icon
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
