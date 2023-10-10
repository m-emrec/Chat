import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../config/theme/theme.dart';

class SocialMediaLinksExpanded extends StatefulWidget {
  const SocialMediaLinksExpanded({super.key});

  @override
  State<SocialMediaLinksExpanded> createState() =>
      _SocialMediaLinksExpandedState();
}

class _SocialMediaLinksExpandedState extends State<SocialMediaLinksExpanded> {
  final List _icons = [
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
    // const FaIcon(
    //   FontAwesomeIcons.facebook,
    //   size: 32,
    // ),
    // 8.pw,
    // const FaIcon(
    //   FontAwesomeIcons.instagram,
    //   size: 32,
    // ),
    // 8.pw,
    // const FaIcon(
    //   FontAwesomeIcons.twitter,
    //   size: 32,
    // ),
    // 8.pw,
    // const FaIcon(
    //   FontAwesomeIcons.facebook,
    //   size: 32,
    // ),
    // 8.pw,
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        // shrinkWrap: true,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          return Center(
            child: _icons[index],
          );
        },
      ),
    );
  }
}
