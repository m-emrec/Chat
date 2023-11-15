import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bedit%20state%5D/user_profile_body_widgets/change_password_popup.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/Buttons/text_button.dart';
import '../../../../../../injection_container.dart';

class ChangePasswordButton extends StatefulWidget {
  const ChangePasswordButton({super.key});

  @override
  State<ChangePasswordButton> createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  onTap() {
    showDialog(
      context: context,
      builder: (_) => const ChangePasswordPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ButtonText(
          onTap: onTap,
          text: "Change Password",
        ),
      ],
    );
  }
}
