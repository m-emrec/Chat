import 'package:flutter/material.dart';

import '../../../../core/utils/nav_bar.dart';

class ContactsPage extends StatefulWidget {
  static const String routeName = "contacts";

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Navbar(navIndex: 1),
      body: Center(
        child: Text("Contacts"),
      ),
    );
  }
}
