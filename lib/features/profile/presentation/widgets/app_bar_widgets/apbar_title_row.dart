import 'dart:ui';

import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/features/profile/presentation/widgets/app_bar_widgets/social_media_links_collapsed.dart';
import 'package:flutter/material.dart';

import '../../../../../logger.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({super.key});

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      upperBound: context.screenSize.width,
    );

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        child: SizedBox(
          height: 60,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 60,
                width: _animationController.value,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F1).withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: AnimatedSize(
                    duration: _animationController.duration!,
                    child: SizedBox(
                      width: _animationController.upperBound,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // * User name
                            Text(
                              "Name",
                              style: context.textHeme.titleLarge,
                            ),
                            // * Social Media
                            const SocialMediaLinksCollapsed(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
