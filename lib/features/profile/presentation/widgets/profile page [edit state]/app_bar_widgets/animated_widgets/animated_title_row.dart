import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:flutter/material.dart';

import '../social_media_links_collapsed.dart';

class AnimatedTitleRowEdit extends StatefulWidget {
  const AnimatedTitleRowEdit({super.key});

  @override
  State<AnimatedTitleRowEdit> createState() => _AnimatedTitleRowEditState();
}

class _AnimatedTitleRowEditState extends State<AnimatedTitleRowEdit>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      upperBound: 60, // context.screenSize.width,
    );

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  final TextEditingController _nameController =
      TextEditingController(text: "Mustafa Emre Çelik");

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _animationController.duration!,
      child: Container(
        height: _animationController.value,
        width: context.screenSize.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F1).withOpacity(0.0),
        ),
        child: SizedBox(
          width: context.screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * User name
                Expanded(
                  child: TextField(
                    controller: _nameController,
                  ),
                ),
                // * Social Media
                const SocialMediaLinksCollapsed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
