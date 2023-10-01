import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  static const String routeName = "contacts";

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacs"),
      ),
      body: Center(
        child: Text("Contacts"),
      ),
    );
  }
}
