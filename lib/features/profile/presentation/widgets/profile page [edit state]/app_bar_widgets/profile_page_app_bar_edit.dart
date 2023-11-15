import 'dart:ui';

import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bedit%20state%5D/app_bar_widgets/apbar_title_row_edit.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/theme/theme.dart';
import '../../../../../auth/data/models/user_model.dart';
import '../../../bloc/profile_bloc.dart';
import 'profile_options_button_edit.dart';

class ProfilePageAppBarEdit extends StatefulWidget {
  final Size size;
  const ProfilePageAppBarEdit({
    super.key,
    required this.size,
  });

  @override
  State<ProfilePageAppBarEdit> createState() => _ProfilePageAppEditBarState();
}

class _ProfilePageAppEditBarState extends State<ProfilePageAppBarEdit> {
  //! late variables
  late ProfileBloc _profileBloc;
  late ProfileUpdateState state;
  late UserModel data;
  late double _height;
  late Size size;

  @override
  void initState() {
    size = widget.size;

    _height = size.height * 0.45;
    _profileBloc = sl<ProfileBloc>();

    // ! get userData from the state
    state = _profileBloc.state as ProfileUpdateState;

    data = state.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          //* Image Container

          Container(
            decoration: BoxDecoration(
              // * Profile Image
              // ! if [photoUrl] is null , backgroundImage will be null
              //! and first letter of the user's name will be
              //! used instedad of profile picture..
              image: data.photoUrl == null
                  ? null
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data.photoUrl ?? ""),
                    ),
            ),

            // ! if [photoUrl] is null then use first letter of user name.
            child: data.photoUrl == null
                ? Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.scaffold,
                      radius: size.width / 7,
                      child: Text(
                        data.name![0],
                        style: context.textHeme.titleLarge!
                            .copyWith(fontSize: 128),
                      ),
                    ),
                  )
                : null,
          ),

          //* Options Button
          const ProfileOptionsButtonEdit(),

          // * Name and Social Media Accounts Row
          AppBarTitleEdit(
            screenSize: size,
          ),
        ],
      ),
    );
  }
}
