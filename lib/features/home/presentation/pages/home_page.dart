import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/utils/nav_bar.dart';
import 'package:chat_app/features/contacts/presentation/pages/contacts_page.dart';
import 'package:chat_app/features/profile/presentation/pages/profile_page.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      bottomNavigationBar: Navbar(navIndex: _navIndex),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text("Fuck Off"),
            ),
          ),
        ],
      ),
    );
  }
}
