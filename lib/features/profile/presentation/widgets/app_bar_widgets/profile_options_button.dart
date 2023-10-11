import 'dart:ui';

import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../logger.dart';

class ProfileOptionsButton extends StatefulWidget {
  const ProfileOptionsButton({super.key});

  @override
  State<ProfileOptionsButton> createState() => _ProfileOptionsButtonState();
}

class _ProfileOptionsButtonState extends State<ProfileOptionsButton> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
        ),
        child: BackdropFilter(
          //* Blur
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            width: 64,
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.scaffold.withOpacity(0.3),
            ),
            child: SafeArea(
              child: Center(
                child: AnimatedCrossFade(
                  crossFadeState: _showOptions
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 250),

                  ///* Expanded Menu
                  firstChild: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Close Menu Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showOptions = false;
                          });
                        },
                        child: const Icon(
                          Icons.close_outlined,
                          color: AppColors.button,
                        ),
                      ),

                      /// Spacing
                      16.ph,

                      /// Settings Button
                      const Icon(
                        color: AppColors.button,
                        Icons.settings,
                      ),

                      /// Spacing
                      16.ph,

                      /// Edit Profile Button
                      const Icon(
                        Icons.edit,
                        color: AppColors.button,
                      ),

                      /// Spacing
                      16.ph,

                      /// Logout Button
                      const Icon(
                        color: AppColors.button,
                        Icons.logout_outlined,
                      ),
                    ],
                  ),

                  ///* Collapsed Menu
                  secondChild: InkWell(
                    onTap: () {
                      setState(() {
                        _showOptions = !_showOptions;
                      });
                    },
                    overlayColor:
                        const MaterialStatePropertyAll(AppColors.button),
                    child: const Icon(
                      Icons.more_vert_outlined,
                      color: AppColors.button,
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
