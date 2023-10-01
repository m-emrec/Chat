import 'package:chat_app/core/utils/nav_bar.dart';
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
      bottomNavigationBar: Navbar(navIndex: 2),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
