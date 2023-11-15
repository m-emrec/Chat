import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/theme/theme.dart';
import '../../../../../../core/utils/text fields/password_field.dart';
import '../../../../../../injection_container.dart';
import '../../../bloc/profile_bloc.dart';

class ChangePasswordPopup extends StatefulWidget {
  const ChangePasswordPopup({super.key});

  @override
  State<ChangePasswordPopup> createState() => _ChangePasswordPopupState();
}

class _ChangePasswordPopupState extends State<ChangePasswordPopup> {
  late ProfileBloc _profileBloc;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _confirmationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _profileBloc = sl<ProfileBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  String? validator(val) {
    if (val == _controller.text) {
      return null;
    } else {
      return "Passwords don't match !";
    }
  }

  addChangePasswordEvent() {
    /// Checkt if confirmation password is the same with new password.
    if (_formKey.currentState!.validate()) {
      _profileBloc.add(ProfileUpdatePasswordEvent(_controller.text));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Change Password"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PasswordField(
              controller: _controller,
              hintText: "New Password...",
              textInputAction: TextInputAction.next,
            ),
            16.ph,
            PasswordField(
              controller: _confirmationController,
              hintText: "Confirm Your Password...",
              validator: (value) => validator(value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red.shade800),
          ),
        ),
        TextButton(
          onPressed: () => addChangePasswordEvent(),
          child: const Text(
            "Done",
            style: TextStyle(color: AppColors.button),
          ),
        ),
      ],
    );
  }
}
