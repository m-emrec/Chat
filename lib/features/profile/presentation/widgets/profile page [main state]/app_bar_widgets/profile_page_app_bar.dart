import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/apbar_title_row.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/profile_bloc.dart';
import 'option button/profile_options_button.dart';

class ProfilePageAppBar extends StatefulWidget {
  const ProfilePageAppBar({super.key});

  @override
  State<ProfilePageAppBar> createState() => _ProfilePageAppBarState();
}

class _ProfilePageAppBarState extends State<ProfilePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.screenSize.height * 0.45,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: sl<ProfileBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          final data = state as ProfileLoadedSuccessState;

          return Stack(
            children: [
              //* Image Container
              FutureBuilder(
                future: Future.delayed(
                  const Duration(seconds: 0),
                  // () => data.data.photoUrl,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      decoration: BoxDecoration(
                        // * Profile Image
                        // ! if [photoUrl] is null , backgroundImage will be null
                        //! and first letter of the user's name will be
                        //! used instedad of profile picture..
                        image: data.data.photoUrl == null
                            ? null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                image: NetworkImage(data.data.photoUrl!),
                              ),
                      ),
                      // ! if [photoUrl] is null then use first letter of user name.
                      child: data.data.photoUrl == null
                          ? Center(
                              child: CircleAvatar(
                                backgroundColor: AppColors.scaffold,
                                radius: context.screenSize.width / 7,
                                child: Text(
                                  data.data.name![0],
                                  style: context.textHeme.titleLarge!
                                      .copyWith(fontSize: 128),
                                ),
                              ),
                            )
                          : null,
                    );
                  } else {
                    /// If profile pic is loading show [CircularProgressIndicator]
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              //* Options Button
              const ProfileOptionsButton(),

              // * Name and Social Media Accounts Row
              const AppBarTitle(),
            ],
          );
        },
      ),
    );
  }
}
