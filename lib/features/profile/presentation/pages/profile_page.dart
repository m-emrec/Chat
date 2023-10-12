import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/home/presentation/widgets/nav_bar.dart';
import 'package:chat_app/features/profile/presentation/widgets/app_bar_widgets/profile_page_app_bar.dart';
import 'package:chat_app/features/profile/presentation/widgets/user_profile_body_widgets/profile_body.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // * App bar
          ProfilePageAppBar(),

          // * Body
          ProfileBody(),
        ],
      ),
    );
  }
}
