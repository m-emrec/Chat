import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../injection_container.dart';
import '../../../../bloc/profile_bloc.dart';

class ExpandedOptionsMenu extends StatefulWidget {
  final VoidCallback onTap;
  const ExpandedOptionsMenu({
    super.key,
    required this.onTap,
  });

  @override
  State<ExpandedOptionsMenu> createState() => _ExpandedOptionsMenuState();
}

class _ExpandedOptionsMenuState extends State<ExpandedOptionsMenu> {
  addLogOutEvent() {
    sl<ProfileBloc>().add(ProfileLogOutEvent());
  }

  addEditEvent() {
    final state = sl<ProfileBloc>().state as ProfileLoadedSuccessState;
    sl<ProfileBloc>().add(ProfileUpdateDataEvent(state.data));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Close Menu Button
        GestureDetector(
          onTap: widget.onTap,
          child: const Icon(
            Icons.keyboard_arrow_up_outlined,
            color: AppColors.button,
          ),
        ),

        /// Spacing
        16.ph,

        /// Settings Button
        const Tooltip(
          message: "Open Settings",
          child: Icon(
            color: AppColors.button,
            Icons.settings,
          ),
        ),

        /// Spacing
        16.ph,

        /// Edit Profile Button
        Tooltip(
          message: "Edit Profile",
          child: GestureDetector(
            onTap: () => addEditEvent(),
            child: const Icon(
              Icons.edit,
              color: AppColors.button,
            ),
          ),
        ),

        /// Spacing
        16.ph,

        /// Logout Button
        Tooltip(
          message: "Sign Out",
          child: GestureDetector(
            onTap: () => addLogOutEvent(),
            child: const Icon(
              color: AppColors.button,
              Icons.logout_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
