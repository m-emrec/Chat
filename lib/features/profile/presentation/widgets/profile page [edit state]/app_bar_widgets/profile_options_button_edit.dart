import 'dart:ui';

import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/theme/theme.dart';

class ProfileOptionsButtonEdit extends StatefulWidget {
  const ProfileOptionsButtonEdit({super.key});

  @override
  State<ProfileOptionsButtonEdit> createState() =>
      _ProfileOptionsButtonEditState();
}

class _ProfileOptionsButtonEditState extends State<ProfileOptionsButtonEdit> {
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
              bottom: false,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Cancel Edit Button
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: const Tooltip(
                        message: "Cancel Edit",
                        child: Icon(
                          Icons.cancel_outlined,
                          color: AppColors.button,
                        ),
                      ),
                    ),

                    /// Spacing
                    16.ph,

                    /// Save Settings Button
                    const Tooltip(
                      message: "Save Settings",
                      child: Icon(
                        color: AppColors.button,
                        Icons.check,
                      ),
                    ),

                    /// Spacing
                    16.ph,

                    /// Edit İmage Button
                    const Tooltip(
                      message: "Change Profile Image",
                      child: Icon(
                        Icons.image_outlined,
                        color: AppColors.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
