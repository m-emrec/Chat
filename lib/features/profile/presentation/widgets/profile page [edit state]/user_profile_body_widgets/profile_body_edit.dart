import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bedit%20state%5D/user_profile_body_widgets/change_password_button.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bedit%20state%5D/user_profile_body_widgets/email_field_edit_page.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bedit%20state%5D/user_profile_body_widgets/phone_field_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/Buttons/text_button.dart';
import '../../../../../../injection_container.dart';
import '../../../../../../logger.dart';
import '../../../../../auth/data/models/user_model.dart';
import '../../../bloc/profile_bloc.dart';

class ProfileBodyEdit extends StatefulWidget {
  const ProfileBodyEdit({super.key});

  @override
  State<ProfileBodyEdit> createState() => _ProfileBodyEditState();
}

class _ProfileBodyEditState extends State<ProfileBodyEdit> {
  // ! late variables
  late ProfileBloc _profileBloc;
  late ProfileUpdateState state;
  late UserModel userData;

  @override
  void initState() {
    //! define [ProfileBloc]
    _profileBloc = sl<ProfileBloc>();

    // ! get user name from the state
    state = _profileBloc.state as ProfileUpdateState;

    userData = state.data;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! email
                const EmailFieldEditPage(),

                // ? Vertical Spacing
                8.ph,
                //! Change password buttton [TextButton]
                const ChangePasswordButton(),
                // ? Vertical Spacing
                16.ph,
                //!  phone
                const PhoneFieldEditPage(),

                // ? Vertical Spacing
                16.ph,
              ],
            );
          },
        ),
      ),
    );
  }
}
