import 'package:flutter/material.dart';

import '../widgets/profile page [edit state]/app_bar_widgets/profile_page_app_bar_edit.dart';
import '../widgets/profile page [edit state]/user_profile_body_widgets/profile_body_edit.dart';

class ProfilePageEdit extends StatefulWidget {
  static const String routeName = "profile-eidt";
  const ProfilePageEdit({super.key});

  @override
  State<ProfilePageEdit> createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // * App bar
            ProfilePageAppBarEdit(),

            // * Body
            ProfileBodyEdit(),
          ],
        ),
      ),
    );
  }
}
