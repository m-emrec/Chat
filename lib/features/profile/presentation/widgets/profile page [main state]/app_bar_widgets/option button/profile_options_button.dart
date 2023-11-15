import 'dart:ui';

import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/option%20button/expanded_options_menu.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';

import '../../../../../../../config/theme/theme.dart';

class ProfileOptionsButton extends StatefulWidget {
  const ProfileOptionsButton({super.key});

  @override
  State<ProfileOptionsButton> createState() => _ProfileOptionsButtonState();
}

class _ProfileOptionsButtonState extends State<ProfileOptionsButton> {
  bool _showOptions = false;

  expandOptions() {
    setState(() {
      _showOptions = true;
    });
  }

  collapseOptions() {
    setState(() {
      _showOptions = false;
    });
  }

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
                  duration: const Duration(milliseconds: 350),

                  ///* Expanded Menu
                  firstChild: ExpandedOptionsMenu(onTap: collapseOptions),

                  ///* Collapsed Menu
                  secondChild: InkWell(
                    onTap: expandOptions,
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
