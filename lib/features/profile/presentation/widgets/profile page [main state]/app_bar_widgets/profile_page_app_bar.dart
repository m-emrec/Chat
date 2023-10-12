import 'dart:ui';

import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/apbar_title_row.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/social_media_links_collapsed.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/social_media_links_expanded.dart';
import 'package:flutter/material.dart';

import 'profile_options_button.dart';

class ProfilePageAppBar extends StatefulWidget {
  const ProfilePageAppBar({super.key});

  @override
  State<ProfilePageAppBar> createState() => _ProfilePageAppBarState();
}

class _ProfilePageAppBarState extends State<ProfilePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenSize.height * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          //* Image Container
          FutureBuilder(
            future: Future.delayed(
                Duration(seconds: 0),
                () =>
                    " https://yandex.com/images/search?source=morda&text=macro+photography+of+nature&pos=1&rpt=simage&img_url=https%3A%2F%2Fwallbox.ru%2Fwallpapers%2Fmain2%2F201910%2Fkapli-list-korovka-boza.jpg&utm_campaign=morda&nl=1&lr=115702&utm_source=yandex" //FirebaseAuth.instance.currentUser!.photoURL ?? "",
                ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    // * Shadow
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 5),
                        spreadRadius: 8,
                      ),
                    ],
                    // * Profile Image
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      // TODO: Change It with user photoUrl
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/91/6b/19/916b19d55e698b335c9eaf03d7eb511a.jpg" // FirebaseAuth.instance.currentUser!.photoURL ?? "",
                          ),
                    ),
                  ),
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
      ),
    );
  }
}
