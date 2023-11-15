import 'package:chat_app/core/extensions/context_extension.dart';
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
  late Size _size;

  @override
  void didChangeDependencies() {
    _size = context.screenSize;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // * App bar
              ProfilePageAppBarEdit(
                size:
                    _size, //Size(constraints.maxWidth, constraints.maxHeight),
              ),

              // * Body
              const ProfileBodyEdit(),
            ],
          ),
        );
      }),
    );
  }
}
