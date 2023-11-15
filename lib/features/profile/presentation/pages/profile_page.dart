import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/utils/snackbars/error_snack.dart';
import 'package:chat_app/core/utils/snackbars/success_snack.dart';
import 'package:chat_app/features/home/presentation/widgets/nav_bar.dart';
import 'package:chat_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:chat_app/features/profile/presentation/pages/profile_page_edit.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/profile_page_app_bar.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/user_profile_body_widgets/profile_body.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc _profileBloc;
  @override
  void initState() {
    _profileBloc = sl<ProfileBloc>();
    _profileBloc.add(ProfileGetDataEvent());
    // _profileBloc.add(ProfileUpdateDataEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          switch (state.runtimeType) {
            case ProfileUpdatedSuccessState:
              state as ProfileUpdatedSuccessState;
              ScaffoldMessenger.of(context).showSnackBar(
                SuccessSnack(text: "${state.tag} Successfully Updated"),
              );
              break;
            case ProfileUpdatedFailState:
              state as ProfileUpdatedFailState;
              ScaffoldMessenger.of(context).showSnackBar(
                ErrorSnack(text: "${state.errorMesg} "),
              );
              break;
            default:
          }
        },
        listenWhen: (previous, current) => current is ProfileActionState,
        buildWhen: (previous, current) => current is! ProfileActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProfileLoadingState:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ProfileLoadedSuccessState:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // * App bar
                  ProfilePageAppBar(),

                  // * Body
                  ProfileBody(),
                ],
              );
            case ProfileUpdateState:
              return const ProfilePageEdit();
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
